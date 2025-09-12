Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0ADB54BAF
	for <lists+freedreno@lfdr.de>; Fri, 12 Sep 2025 13:54:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E1D10EC2B;
	Fri, 12 Sep 2025 11:54:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="caipe07O";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADFFD10EC2A
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 11:54:40 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fWvI013177
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 11:54:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CL+lI9VYcTxc1ylzMUGhgewY3tUhb2X7dvXH5IYD2tM=; b=caipe07OT38c4Ooj
 i5GS6gjRDKPJxngB9qSRS3lGHGBzaJ23DY1OTTMbT9bFx42LgXJB1JMNi50SDOXX
 CYaUzwoqLP6lDS91llXVumAo+FErbCJnBbN81ZdvAYdvP0AAQY7u/PwnCXh6YYq2
 5zTjWuIP9tm9erikfJ2KkwjRRGCGYe4Kb8DDwy0M/DwY1qZNg+1NujGaHY57X94D
 PW9oukioENMcRLyAm0X4EXawsB+GZNqRKLfBojab1Wy/LTBYcI0rHX5PWXp8g8Zv
 CdhJNLcL0IsSP2ds/+7iSiRHYRtuFK7Ax80KpGgUPo3j5Pq95ANq5TAj+hHoInr1
 ZiK/tQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqgb8jc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 11:54:40 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b4e516e0e2cso340154a12.0
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 04:54:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757678079; x=1758282879;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CL+lI9VYcTxc1ylzMUGhgewY3tUhb2X7dvXH5IYD2tM=;
 b=sfZZUlRkn1DRFilU3SE3DeUc7dYLpftGUtMWWxdswJ9qJmeAgTkj3yw6m+GNcYiWbg
 VnVlt4TqfcWjviVfZyZx/Zo+cwCdrsyq7cGTRDnOE5kXSL1yfFcCDh5OCz8cTET7PEbN
 60kdOzqG7f3sVcIHJ0sIXkoHZe3USW7POzE9tdmorBM8y6ZetBzofJNMEKbvD5BKm5AS
 evIqDHUlioy29I5GwlNSpyZEUpW2gEeftJDBoWHApFiCnRGlFKhIU0e0ArZgv3jeQtJI
 xkzxnNcYhaQgIO2FuY5W/Qw11apqjFlHgZ9HrvBFK9p8LbOm8Z9cCd5yTn5TxN5lGkk8
 UJlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnRnttw53Oc6cb0yvIwd9RnJHslOSh8tQRouJmTXjzslm/+ZnIU9CgvCdGixHEE3zhbKuA+GCtUng=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWpkRI7SytQxunWnwxkcKBaYluyHkizk9siKeqfaTEvu2/GZ5b
 2vIn2e6A+QXphsFtzB9aA4VGXIobszy1bOFk/AbLw711dJEo5tXd0sDBoyDNzxJU/DJQxJ57S8h
 hJ37XzLhXSt8GFG6gFNeNZb9IxjE2TTA247/cOlf42jJ0kfOCe1Lak+5S9kVVqn7GrlE5ffI=
X-Gm-Gg: ASbGnctdwpGLV4MHI3N8k99lkv2Gui8KEuGLD1ezzPIUZ59PuEG1Sl2ZdmiIz44XXOi
 dHCPzLLMlq8mGthb1J3nfZh/mmU4nGzRCEEqgRuZvT0yysA/w6Az+kFPAQF8wGjhC8T2LRN155U
 3ZeIMjCH+Cs+cIOMW1jJDLJWndf3cvj8UMWrHR0GHVmivJc2gYG3UGcgbaQPm5b7y65elJEGpN3
 U2Sd3qqNeHd6glqBp55uusNqJC9E6WCZslo2gTsA7kZi4XHHN4m5wqIG8n8LmYRyj7bah5F0WaM
 fw3nGmUsSEgl93b+SvIupR6dXT1WL4BA4rwR6m2tDFa7eHqDkmCpK7xMQTHhuxv2VtWC4B+soSf
 j8/+1p/NqVPvGzmRdMTZxRD5LCc7ojA==
X-Received: by 2002:a05:6a00:181e:b0:755:2c5d:482c with SMTP id
 d2e1a72fcca58-776121ec346mr1687414b3a.4.1757678079351; 
 Fri, 12 Sep 2025 04:54:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBzCCMI7c4SuCgUNoxpx0ryUhDrHgck7Ry4SOIXMr3U9+ASTVocgB9v5TDYgVMzzCnDhSBlA==
X-Received: by 2002:a05:6a00:181e:b0:755:2c5d:482c with SMTP id
 d2e1a72fcca58-776121ec346mr1687392b3a.4.1757678078920; 
 Fri, 12 Sep 2025 04:54:38 -0700 (PDT)
Received: from [10.133.33.174] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77607a46b7asm5251168b3a.22.2025.09.12.04.54.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Sep 2025 04:54:38 -0700 (PDT)
Message-ID: <d3743c52-4e84-4729-9f64-af856419d504@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 19:54:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: display/msm: dp-controller: Add SM6150
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
References: <20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com>
 <20250912-add-dp-controller-support-for-sm6150-v1-1-02b34b7b719d@oss.qualcomm.com>
 <sx64y6vfov4yag46erckpbl7avwmqlsqt3siebckn76m6jqxjh@f5lueyih6n3q>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <sx64y6vfov4yag46erckpbl7avwmqlsqt3siebckn76m6jqxjh@f5lueyih6n3q>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dz_bioaGOvRU8rEG3ppVpXByT5VeoUQe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfXziQkAEF0LWK9
 sC45IjglhtJp1nqUxDRkckCpCNg3Lj0ZcWJNCB3YY17Z/PukGCzo6TXctX10n+MjNSaCihSTKpu
 RztNUvzs9j56LHlLCtIgEZDYxetNKVOeISiDrejtC3gX34vMYIUKvXNa9ZbMRz6dQ6FAwfPj+rb
 arP651vUArkuyTCabAprjsC2Ekk7iUlg9PGP+5+z2AvzGAPWgGxCa69PoQ7zuGO4JTbJ3WwV9Dw
 YrdtTPWyQcclCv6zRGgS0OxuRoD7GsO3rth33socBpVWbb+IEZ0sg6aV/0So5YlPcVXD/+FJqwn
 bM+ILqCllU4Pf+Lh3at1Al9eWRq4bhOo9wBgS27nnWT6g69uTRiHCsRtgYc/cpPtBL0eesi38KS
 Ybi6FY7Z
X-Proofpoint-GUID: dz_bioaGOvRU8rEG3ppVpXByT5VeoUQe
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c40a00 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=1DKY8yufIZSdyzbmga8A:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035
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


On 9/12/2025 7:46 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 12, 2025 at 07:39:16PM +0800, Xiangxu Yin wrote:
>> Add DisplayPort controller for Qualcomm SM6150 SoC.
>> SM6150 shares the same configuration as SM8350, its hardware capabilities
>> differ about HBR3. Explicitly listing it ensures clarity and avoids
>> potential issues if SM8350 support evolves in the future.
> The controller is exactly the same as the one present on SM8150. HBR3 is
> a property of the PHY.


Ok, will update commit msg.


>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> index aeb4e4f36044a0ff1e78ad47b867e232b21df509..2bebc182ffe348fd37c215a6bf0becea11e5ac15 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> @@ -46,6 +46,7 @@ properties:
>>        - items:
>>            - enum:
>>                - qcom,sar2130p-dp
>> +              - qcom,sm6150-dp
>>                - qcom,sm7150-dp
>>                - qcom,sm8150-dp
>>                - qcom,sm8250-dp
>> @@ -261,6 +262,7 @@ allOf:
>>              enum:
>>                - qcom,sc8180x-dp
>>                - qcom,sdm845-dp
>> +              - qcom,sm6150-dp
>>                - qcom,sm8350-dp
>>                - qcom,sm8650-dp
>>      then:
>>
>> -- 
>> 2.34.1
>>
