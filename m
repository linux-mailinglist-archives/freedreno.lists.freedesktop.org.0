Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC96B2C29A
	for <lists+freedreno@lfdr.de>; Tue, 19 Aug 2025 14:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6959810E5BD;
	Tue, 19 Aug 2025 12:04:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dVq0ZZhM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD56510E577
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 09:21:48 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90b7Y027047
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 09:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XeLoNElQRYDHRk++SgBPgdfN1LI9ODXyEKJtgngTUGA=; b=dVq0ZZhMETwhqEnt
 s9EfemQb6XzcugD0fg40sr83pH+2k2K+UZgvgtAqw3++2bTs7uSCmU71SU/ZjD0B
 AfsOk8hvc8Q7Kr81MndamSUWR2bF7md+pIjAgPxSGlFjYjbfFSsrlTJT7NXtddY+
 rnMEi8lGjgX8pt4zPAnjAZ1fTfPV29jlnqbA2zrbTwLMrtYmAQxQFTsTNV4fehh7
 nNOJVdCMl5T2Rcq6ZyCN407NxCXsuYu4QK37AVfeLuyZNIoxOvTb3xO98iOGtoLv
 DzynLzO1RjTNZMNMCSZhfThoyRcF0sJJh2RxMM0amncpykOcsHo0PJqKMTtdaD6H
 pJ5tAQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhjyfy69-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 09:21:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-24458274406so123514365ad.3
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 02:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755595306; x=1756200106;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XeLoNElQRYDHRk++SgBPgdfN1LI9ODXyEKJtgngTUGA=;
 b=nMaePJC5G3lE0FZ48OrJl0pfrcqjR2t5F88Z+D93TLLMeodfALYG0dG9HeDZY1LniB
 Ri0cgEG078feFbNW0p4ADGe4aTTjclssosLeLLD/IouE0Nv7pcVxDDcQl2YSKJymALdW
 XmWL/kZ+VumMk6KUXK5o7QVnQvRUwS84tmQi0wKuirPF/vlrikYwbanyK4Tm5PHm0SMF
 xyfnYYMOOzHHeOHQXgRF5hnshU4Xvb0gZumRSO8zv7Y0BFo2HFu5lDNdJ+YAz+8G5KyO
 /sQmX/9yg7hGCvIWDnIRwJNJQpeuw4BHLNfURaDgiiEcFVu+StebcpqDfK/rrdn1VxNW
 gmDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXq+4kpbf/cxpoHXwOSOOxctRhZMiCqVu5SFwF+9IKzUF1V368ECrEVMW6RJTUeY22gsor89WTP1r8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0Ywg5JNxyqaJJFeA5T2DXZi0QqfkipBE2UY5djATwLBYxQSbg
 InnNGOjiPEx3H1lG/H57A9CeNOmWl9wVo1L2lEd184uRFf5qC9twQzZ4fDDY11ZEXZlnbKOwKM+
 PNn9qZgrpQ6EUe4YShYs72uMKCL35+okNsQN4XdxlSKkj/4+a23XP4ITuaUMPi65i9y5pl8I=
X-Gm-Gg: ASbGncu/kBhe3iTWhsLFH7brsthbqywQvv58PyfCCPVASb+FKk0l+1hHL6BUWcoIGaN
 8pykdqi7axa/lcAl4S7z1ufofhboXyLBg3mQzGhmjCJPJDoByfX34tKfGRZvejlnrYQZrfHsjqB
 Vl+NG//Gt9C4lcfL3qRmexoZkdJH2U4Ze+7H1hHQdfh1yRjoguxWoE2qlVnU1I0CbIj7M1nNj9+
 +MlHtFijfjYT61dy7oz2OJNSgHEEj7of1G0tzufmLWB9B3eufoDM53BcNnKRa0tgJSjYDip091A
 e9A28a5zw1pDe9lvrydIknYvyBQpsdjytHicWOE52nUo+uzeA3C6BT0owOZm/O2W7Q0cdcCda9t
 bEYk6jh2dsR2hth1eR32W+2BgWiH7YQ==
X-Received: by 2002:a17:903:37ce:b0:240:4b3b:334f with SMTP id
 d9443c01a7336-245e04926b5mr26682815ad.34.1755595305590; 
 Tue, 19 Aug 2025 02:21:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpiiFaPA8kQRfNSDplxINgiGA8HlGb5Wu8T7SwEDTnoUTiI6Noo4c+zpUmfz128LX8UgJLAw==
X-Received: by 2002:a17:903:37ce:b0:240:4b3b:334f with SMTP id
 d9443c01a7336-245e04926b5mr26682375ad.34.1755595305122; 
 Tue, 19 Aug 2025 02:21:45 -0700 (PDT)
Received: from [10.133.33.87] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446caa3806sm103046795ad.28.2025.08.19.02.21.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 02:21:44 -0700 (PDT)
Message-ID: <76ff9434-eeaf-4ee0-a8fa-aec566c46c2a@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 17:21:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
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
References: <20250819-qcs8300_mdss-v7-0-49775ef134f4@oss.qualcomm.com>
 <20250819-qcs8300_mdss-v7-2-49775ef134f4@oss.qualcomm.com>
 <20250819-ant-of-ultimate-genius-fbfa1a@kuoka>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <20250819-ant-of-ultimate-genius-fbfa1a@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QcAhP5zB1nyPrQSbDQxV-lopS9zU_cE6
X-Authority-Analysis: v=2.4 cv=ZJHXmW7b c=1 sm=1 tr=0 ts=68a4422b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=b6vJvH-rrpbGiSTQa0AA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: QcAhP5zB1nyPrQSbDQxV-lopS9zU_cE6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyOCBTYWx0ZWRfX67zY14NtD4Eu
 kEdM/t/4b9uN0fuqJ4O/RKFkRtXsAtwduWGMJy01XGwCpnELynIyCC8S/a3cxSclVSc8FDPM7XR
 6x4bKfX+rfR9gVBA/DfzKKEOFBlTt+y3eGNbAW35n4VaB36g9xSwlDWN1eKJ3PMlo6wNMpVfxOY
 coXlU5Gl1SNL/JPz/QHnLAepe+0qpObIaSlMGcS4jS8xsu3xSXQz1QcPFPmYvTQjr66tBZnE7d3
 qth9/pLg/MiHIDvJc47L1i/GZ+QdIOoTAZp3JpWLfzxrog2aR3p2tpGpSa4eWTAGSMRs2oDhXxo
 8+IQa0MhiV3CRWVyZ+tT4nvBQoB9HYp6+KI88lFwIfQKMUjNv+jNekZKroqYRIdPEsk0ycRE+YT
 5YTu8Euk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160028
X-Mailman-Approved-At: Tue, 19 Aug 2025 12:04:42 +0000
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



On 2025/8/19 15:58, Krzysztof Kozlowski wrote:
> On Tue, Aug 19, 2025 at 11:33:29AM +0800, Yongxing Mou wrote:
>> Add compatible string for the DisplayPort controller found on the
>> Qualcomm QCS8300 SoC.
>>
>> The Qualcomm QCS8300 platform comes with one DisplayPort controller
>> with same base offset as SM8650. But it requires new compatible string
>> because QCS8300 controller supports 4 MST streams. 4 MST streams will
>> be enabled as part of MST feature support. Currently, using SM8650 as
>> fallback to enable SST on QCS8300.
> 
> I don't think last sentence is true. Where in current code SM8650 is
> used as fallback?
> 
Sorry, this more like a description error. As Dmitry pointed out, we are 
not using SM8650 as a fallback; we are only using SM8650's data 
structure in the driver. I will correct the commit message in the next 
version. Thanks.
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
> 
> ...here not.
> Emm, if we need new compatable, can we add qcom,qcs8300-dp here? 
>>             - qcom,sa8775p-dp
>>             - qcom,sc7180-dp
>>             - qcom,sc7280-dp
> 
> Best regards,
> Krzysztof
> 

