﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ElectronicSubmission.ServiceReferencePayment {
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="ServiceReferencePayment.CheckPaymentServiceSoap")]
    public interface CheckPaymentServiceSoap {
        
        // CODEGEN: Generating message contract since element name CheckPaymentResult from namespace http://tempuri.org/ is not marked nillable
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/CheckPayment", ReplyAction="*")]
        ElectronicSubmission.ServiceReferencePayment.CheckPaymentResponse CheckPayment(ElectronicSubmission.ServiceReferencePayment.CheckPaymentRequest request);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/CheckPayment", ReplyAction="*")]
        System.Threading.Tasks.Task<ElectronicSubmission.ServiceReferencePayment.CheckPaymentResponse> CheckPaymentAsync(ElectronicSubmission.ServiceReferencePayment.CheckPaymentRequest request);
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class CheckPaymentRequest {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="CheckPayment", Namespace="http://tempuri.org/", Order=0)]
        public ElectronicSubmission.ServiceReferencePayment.CheckPaymentRequestBody Body;
        
        public CheckPaymentRequest() {
        }
        
        public CheckPaymentRequest(ElectronicSubmission.ServiceReferencePayment.CheckPaymentRequestBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute()]
    public partial class CheckPaymentRequestBody {
        
        public CheckPaymentRequestBody() {
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class CheckPaymentResponse {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="CheckPaymentResponse", Namespace="http://tempuri.org/", Order=0)]
        public ElectronicSubmission.ServiceReferencePayment.CheckPaymentResponseBody Body;
        
        public CheckPaymentResponse() {
        }
        
        public CheckPaymentResponse(ElectronicSubmission.ServiceReferencePayment.CheckPaymentResponseBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class CheckPaymentResponseBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=0)]
        public string CheckPaymentResult;
        
        public CheckPaymentResponseBody() {
        }
        
        public CheckPaymentResponseBody(string CheckPaymentResult) {
            this.CheckPaymentResult = CheckPaymentResult;
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface CheckPaymentServiceSoapChannel : ElectronicSubmission.ServiceReferencePayment.CheckPaymentServiceSoap, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class CheckPaymentServiceSoapClient : System.ServiceModel.ClientBase<ElectronicSubmission.ServiceReferencePayment.CheckPaymentServiceSoap>, ElectronicSubmission.ServiceReferencePayment.CheckPaymentServiceSoap {
        
        public CheckPaymentServiceSoapClient() {
        }
        
        public CheckPaymentServiceSoapClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public CheckPaymentServiceSoapClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public CheckPaymentServiceSoapClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public CheckPaymentServiceSoapClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        ElectronicSubmission.ServiceReferencePayment.CheckPaymentResponse ElectronicSubmission.ServiceReferencePayment.CheckPaymentServiceSoap.CheckPayment(ElectronicSubmission.ServiceReferencePayment.CheckPaymentRequest request) {
            return base.Channel.CheckPayment(request);
        }
        
        public string CheckPayment() {
            ElectronicSubmission.ServiceReferencePayment.CheckPaymentRequest inValue = new ElectronicSubmission.ServiceReferencePayment.CheckPaymentRequest();
            inValue.Body = new ElectronicSubmission.ServiceReferencePayment.CheckPaymentRequestBody();
            ElectronicSubmission.ServiceReferencePayment.CheckPaymentResponse retVal = ((ElectronicSubmission.ServiceReferencePayment.CheckPaymentServiceSoap)(this)).CheckPayment(inValue);
            return retVal.Body.CheckPaymentResult;
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        System.Threading.Tasks.Task<ElectronicSubmission.ServiceReferencePayment.CheckPaymentResponse> ElectronicSubmission.ServiceReferencePayment.CheckPaymentServiceSoap.CheckPaymentAsync(ElectronicSubmission.ServiceReferencePayment.CheckPaymentRequest request) {
            return base.Channel.CheckPaymentAsync(request);
        }
        
        public System.Threading.Tasks.Task<ElectronicSubmission.ServiceReferencePayment.CheckPaymentResponse> CheckPaymentAsync() {
            ElectronicSubmission.ServiceReferencePayment.CheckPaymentRequest inValue = new ElectronicSubmission.ServiceReferencePayment.CheckPaymentRequest();
            inValue.Body = new ElectronicSubmission.ServiceReferencePayment.CheckPaymentRequestBody();
            return ((ElectronicSubmission.ServiceReferencePayment.CheckPaymentServiceSoap)(this)).CheckPaymentAsync(inValue);
        }
    }
}
