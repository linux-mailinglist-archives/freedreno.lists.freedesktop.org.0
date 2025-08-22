Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32090B30C28
	for <lists+freedreno@lfdr.de>; Fri, 22 Aug 2025 05:07:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B5510E1A3;
	Fri, 22 Aug 2025 03:07:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oIUevZtk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F2D10E1A3
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 03:07:08 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57LIAIDv026594
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 03:07:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Pxpzoua12tLHfrXr6eKWYcgK4UktGakrNy1rHaxMHtU=; b=oIUevZtkPPeTB/UH
 YpJ80T7C80wc+AKIoXrr3blYkurTWLt+PF5mmTnnCJpBZmIO0e4gbKW1haIe2AoE
 YUD/GasEdqcoTsVf2f5bikKExuslSe7NSEDq/+G1UDM0eH/lxRcCEaiwH0xILAud
 eYDLxIqxWvBQE07yTzddOrtblZJ5tjmMaqF4a96by5QoqWtPZqcZqmCRIFJ+0tHu
 ZchrKhfBf5k0q6SMeZHD+RPdw1R3TqgKjrcN24r9h0r/HxxgBg5EuNp4wRo2SbhG
 vxB0H6AxmkbnNZeJdXtONen9a3akJjtGMIOR9TMmaSI20x4aGfom80A/pEmmXOEb
 d357OQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52afnaq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 03:07:07 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-77031d4636aso281944b3a.1
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 20:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755832026; x=1756436826;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pxpzoua12tLHfrXr6eKWYcgK4UktGakrNy1rHaxMHtU=;
 b=MG9o0k4TIAFPvc6gytI8BLOsj2aW3hLNg+OpnuPV+PpSYl2i7HRMEms9C9Y7h830do
 oFDqeqFxn3sbXVIplmkKXmqOvAEeQhTg5gMUv0b/1T6yiLTamaPEX6qn7ureGiV8L0uy
 ayJz1E6p+oX+ByCzsKjeYsrQyFms4FydZAxNGLa9EGjlFEaWkIqlGS7VRQXI3eTb7yph
 DKXdkKBhDgHf1aGwOD/hzybVs9uAAdCROzxe4663CEjFleyeAzDw94CnOZZWJ1zmSkV9
 2pJvGdN737nj4pFazYVfhrlQNQ90qNX5eeKCIweDb597XKrvPuhOZXa5uubpsOdb4OKb
 EUiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVx5vJNQfhi8CufwxrKnlX0Y4tmG3cdfpH+jED17x+6Nm1TdKDLHeGTAV4iy/9zsiUwUcwOqoUeq0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBT8417qxp4ej9gv/r9u8EETep+Cwhdlqp4vtcjMAR5a++PSx7
 3J9DnqKc+mJ7RjO/rb8Q8GRR4pfnMh++QIGAUbhqPxnvt66mJA4YeC/C83dirRHe2I9giHBytjH
 mJkA9jl9v5f+DNRfApgVEsNyCRZzNPXWdTWdiVf7lUPxKEH6own0Iks9aet+wmaFEdfYVSJ0=
X-Gm-Gg: ASbGncsa0zGojbxa/SksYer7NSZ6DIe86aM9f0DhT24wfviCO9c5gXo/9unKzW82z8d
 5neJTTH+uvV6BBX5jEl78ZOZrp5/wyYTHDxXKc0d8a2SUgiE8BBotZflrfHnUExNTQq/OXJ5k+j
 BV3A4FenA9fMnY/UwLfbcL/RD2DequUzLNX4+94LZ2aIQmx+P1Q+Ww5fIdfD6rtfSGPurvpTGas
 U6Dir5gp+IT5Y8eD+ILHe6z3/ylWYeP/mf2Fc4HmcLKeXO9aiodgGWFcCm16Rp76DEDzJ2y18Jh
 N01n+o5m0F4SSRcXZzVWAauG7t+zU3xhIdQj6DQ4HLPtRIJyjGqnR6mXynRyXnXoht/pQ4JEDtW
 kr7pW5dmdSpJt8OdPBS9OBbGabsZgqsw=
X-Received: by 2002:a05:6a00:1250:b0:746:25d1:b712 with SMTP id
 d2e1a72fcca58-770305502d9mr1704504b3a.7.1755832026269; 
 Thu, 21 Aug 2025 20:07:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1JA2VCDcV2+V8VJTmn9OkNnFsSh8CLqRYnXkRkboKjGmu9lPcU6GL20crR8lgOhhfna8V2w==
X-Received: by 2002:a05:6a00:1250:b0:746:25d1:b712 with SMTP id
 d2e1a72fcca58-770305502d9mr1704457b3a.7.1755832025754; 
 Thu, 21 Aug 2025 20:07:05 -0700 (PDT)
Received: from [10.133.33.124] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e7d54e0cfsm9319484b3a.109.2025.08.21.20.06.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 20:07:05 -0700 (PDT)
Message-ID: <b86a1759-e49f-48b1-833d-fdc37b450f5e@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 11:06:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com>
 <20250821-qcs8300_mdss-v8-2-e9be853938f9@oss.qualcomm.com>
 <3ws6xfmmrnjybn4umbbnzjdksqberzuxslz6uxpabtsz2yzyss@jwblshilyx4p>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <3ws6xfmmrnjybn4umbbnzjdksqberzuxslz6uxpabtsz2yzyss@jwblshilyx4p>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 20g3HVnJ7WNid3H8_f6hQ8uQKv58zyfJ
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a7dedb cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=fJEs4nZSSkEPFCngLhoA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 20g3HVnJ7WNid3H8_f6hQ8uQKv58zyfJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXzgGlNMQqeJNG
 U5Eb9XqnMshkQ4WqXUEazco2MaZqA4+ndzwA9T4xz69WSrN0cqOXaiKPQETw3f3Iwd7vHLrEtLp
 x+Xt/O66mwD7GcD8cyAu+NsakFKbmjVIL5k7p8VCh4XnbuFOU4NDuTw8trMSqNdIXVd16vF+Cbu
 dBnkcr4DEZcTdpIEASLQpIWghtDcyRPCiNaNIV+CNG/BL3Gc4GJ3BQfJly0bWtIA0oA8ChVPXBv
 we12ISqJKN9dRy+Vn8TNpuReLD/3fxwnxSGXfY6swn54Z3TlJsMBSizPPii0+ozDkLWUYfAKzfU
 2ksVTMIumQ3t3UGhIkCjYW959PQBauxuKlSzp30N0Ss4UqO7s8CPcQ7ZNw7i8uYuEFznztIzxAk
 XugA6vwzcCi5KHwsU2RulvRUbGxiJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 2025/8/21 18:28, Dmitry Baryshkov wrote:
> On Thu, Aug 21, 2025 at 11:35:57AM +0800, Yongxing Mou wrote:
>> Add compatible string for the DisplayPort controller found on the
>> Qualcomm QCS8300 SoC.
>>
>> The Qualcomm QCS8300 platform comes with one DisplayPort controller
>> with same base offset as SM8650. It requires new compatible string
>> because QCS8300 controller supports 4 MST streams. And 4 MST streams
>> support will be enabled as part of MST feature support. Currently, using
>> SM8650 data structure to enable SST on QCS8300 in the driver.
> 
> Bindings describe the hardware. There is no point in discussing the
> driver here.
> 
Thanks for point it.. "The Qualcomm QCS8300 platform comes with one 
DisplayPort controller that supports 4 MST streams", do you think this 
description will more appropriate?, only discusses the DP controller, 
not referencing the driver or SM8650..
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> index 68a6fd27506fda004e53174db5bcc88a29e8d2a6..ac44abfdd2853393ae199387c9ae2c37e1c48f52 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> @@ -18,6 +18,7 @@ properties:
>>     compatible:
>>       oneOf:
>>         - enum:
>> +          - qcom,qcs8300-dp
>>             - qcom,sa8775p-dp
>>             - qcom,sc7180-dp
>>             - qcom,sc7280-dp
>> @@ -179,6 +180,7 @@ allOf:
>>             compatible:
>>               contains:
>>                 enum:
>> +                - qcom,qcs8300-dp
>>                   - qcom,sa8775p-dp
>>                   - qcom,x1e80100-dp
>>         then:
>> @@ -217,8 +219,9 @@ allOf:
>>             compatible:
>>               contains:
>>                 enum:
>> -                # some of SA8775P DP controllers support 4 streams MST,
>> +                # SA8775P DP0 and QCS8300 DP controllers support 4 streams MST,
>>                   # others just 2 streams MST
> 
> QCS8300 has only one DP. As such, it doesn't belong to this clause.
> 
Emm,thanks, i got this point. So here need add another clause only work 
for QCS8300(one DP controller with 4 streams), and i put codes before
"# Default to 2 streams MST", is this the correct place?

-          # Default to 2 streams MST
-          properties:
-            clocks:
-              minItems: 6
-              maxItems: 6
+          if:
+            properties:
+              compatible:
+                contains:
+                  enum:
+                    # QCS8300 only have one DP controllers support 4 
streams
+                    # MST, no second DP controller.
+                    -qcom,qcs8300-dp
+          then:
+            properties:
+              clocks:
+                minItems: 8
+                maxItems: 8
+          else:
+            # Default to 2 streams MST
+            properties:
+              clocks:
+                minItems: 6
+                maxItems: 6
>> +                - qcom,qcs8300-dp
>>                   - qcom,sa8775p-dp
>>         then:
>>           properties:
>>
>> -- 
>> 2.34.1
>>
> 

