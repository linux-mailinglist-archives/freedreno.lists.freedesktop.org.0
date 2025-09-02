Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 020B2B3F6D5
	for <lists+freedreno@lfdr.de>; Tue,  2 Sep 2025 09:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC3510E39A;
	Tue,  2 Sep 2025 07:43:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GpUoSuu7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8331410E3A2
 for <freedreno@lists.freedesktop.org>; Tue,  2 Sep 2025 07:43:05 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822Rrx0022018
 for <freedreno@lists.freedesktop.org>; Tue, 2 Sep 2025 07:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fnjTF+IaCjsvagtTVWlYOHKpZG1AVIayRYMdSpwzC9U=; b=GpUoSuu7mKd8Hyro
 /q/p0CkBzAU7HRLqZm4RO77++CCtkoxWiTOPqKHeAPZwRkf3nfZQ/nGGN1e43L1h
 sgGacleD8tpHlRpV1c/mqbwi3QkRvMkb6DRQQtFYytniJATyn6q0ZcM70J+2X3lL
 qeWF9hXYn9z5ZzmLmhSOluSoKl+9zmiqvUqIjsI61LYJwCT56cq/cfoRkZSgLWdO
 86AMe3sbpaxf9DEP3pmAozt979kkE08scF2tWo5YrSK7cFI4k9kMid6FrhnG7pv3
 ojF007vIh5VZVmK0r8iApiz5JXbqdNVorX/Gpk3Obkhm2PVtX0GdirrZxrOlVTbv
 e6LYyA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnp7489-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 07:43:04 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7724688833bso2513198b3a.2
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 00:43:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756798983; x=1757403783;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fnjTF+IaCjsvagtTVWlYOHKpZG1AVIayRYMdSpwzC9U=;
 b=htTE66lUhhOLtZkFURJKYEaOstDFNst5XnyPMlzW4Lw9/GPxbVDKmruJH6qAL5Irdd
 MyhFMrPfQKjkApcdARTLDE14KavNCP9e2vePirvPWTvETvSjJ/BGw6IIT9UlYkvsFnx9
 9aM1MygiG+7IUf2UjRV7l8TKfRpJBuLZjL33YOLNI15eifLRwDhCuPLlomip5Qu5hSg3
 qAO5ziktAN2tGpyL9G7D+kNHXkQo2ihVt4suT7m3HdH18EkJs8+1/coZzMCFnmZRf6/Z
 eQ8WDxZ8q//gPdpD3pFNHmOOmEMUgMSLEPjf9SOQB7BofQa4RrKRZR4t/Xchml7cZMrH
 r9JA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/MTpUZC1ZKGXzvopY1nP4bKPHP9iFsfnM69n9PDljXE0IKPLETK8FWQ+v+AZDoR1/9Y2b6KxeXHY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3zcREL+VsKjDgdl73spSx4yZSIPA/pepJ2G23OicDbBSMaTmI
 sf54MCn4a6ah326UI/2WvxcMgMQtSaUGwqgMfGZ+p3s8Fn4tdMk6xTo9XKKbpi4YaxbTMGqCqdJ
 Q/U1CtAjUKL+VuB7+GCvKNawC1ZeNaS4aIyrCnM0/9syNtYyD14JdO6q5cfJ+TojWn0ad+TQ=
X-Gm-Gg: ASbGncseXZMZXoxmGfjvPGQE7gPWBSeIGrHO4Bfghj5LrZx/oafBBeFqz/LMFpn4wXq
 0jcw5rvKW6sMOev6VuGrg727X7oBE5oIiuzGB2r7doaZ1O5JKBC8dsrCSoSwfosIk+2Y+TGCD1H
 nkVdxo74VdWkWMYb2kUtur1uZMEU6bZaF3QGWWp+BrCt2jXYEqogdUMVBFzrFwd2qW9o9n8OWGY
 CEIfkPoPuHNEf7JSgKFDYsbnV2pf6s4e6BPayUXJblN6qotGD0dka+A3Vt5o9PYkZBH2OGACvZ0
 rVK0S+JpLCWqanKTIfmg+1d7fDFTOiUYbS5u6LhZpThSxeTaJgkVlvkdyqeiKuXv/plpiUihf7S
 gBgb1BJY1utvRwMiOSRoJq4D3J3tQhA==
X-Received: by 2002:a05:6a00:92a0:b0:771:fc48:7c1a with SMTP id
 d2e1a72fcca58-7723e396d7cmr13352199b3a.27.1756798983205; 
 Tue, 02 Sep 2025 00:43:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0cW22l8sm4wVKSWuN7QJXzlTLBwumx+hGhHMDLGo3x0YH0EYLjibSDkyAAzWcl6azzB/umQ==
X-Received: by 2002:a05:6a00:92a0:b0:771:fc48:7c1a with SMTP id
 d2e1a72fcca58-7723e396d7cmr13352160b3a.27.1756798982704; 
 Tue, 02 Sep 2025 00:43:02 -0700 (PDT)
Received: from [10.133.33.25] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7725d5b90fasm4602173b3a.100.2025.09.02.00.42.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 00:43:02 -0700 (PDT)
Message-ID: <e59fca7a-4145-4aab-80a5-8305f935e8d4@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 15:42:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/6] dt-bindings: display/msm: dp-controller: document
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
References: <20250901-qcs8300_mdss-v10-0-87cab7e48479@oss.qualcomm.com>
 <20250901-qcs8300_mdss-v10-2-87cab7e48479@oss.qualcomm.com>
 <20250902-speedy-overjoyed-dove-edf2ee@kuoka>
 <fe2867dd-50a6-42d8-92b0-0e29fa7691ee@kernel.org>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <fe2867dd-50a6-42d8-92b0-0e29fa7691ee@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Y4g_ZYJfUhUUmWjn3Xq1Ds5O8jO4_1AE
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b6a008 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=MLVnLUUmlBKzLzVVyHoA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: Y4g_ZYJfUhUUmWjn3Xq1Ds5O8jO4_1AE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX6XsZxpkEiclV
 H56PjJsvqbpZJWA19tk7NDf8eIOHl9V99qGjjovC1sd/nHgQRD/xel3tBXdU2OM5rtUx+SF0dr3
 nzMZthjSXOfUGUdi9iwNBPBO1p0CEn5hJpTUvWwP6YrtU/KEHeDVGOkda2qJh1bHCh7rO3ViZZX
 BmNLmsLbiMG5NculjLwJqL9unw3E+fk9x/SZnX/CcHGCXqSg/xgsZGGTPbIUpUDHNh+avEc3U8v
 on+0TjqPpGz77uOT0WisVVPl2k/8M11w/fMRsnNijUvqr3LFy2iQXJlZdU9Lg201QSPY6IK5UED
 4/PwjLGU7mnD6uaZItwGWndjZu0Rm68nUG7mPh7nmnIhuwuvnw6bI20gklUvCPZEOuPoxIw1Wfc
 277xJ8t5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001
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



On 9/2/2025 2:41 PM, Krzysztof Kozlowski wrote:
> On 02/09/2025 08:38, Krzysztof Kozlowski wrote:
>> On Mon, Sep 01, 2025 at 05:57:30PM +0800, Yongxing Mou wrote:
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              # QCS8300 only has one DP controller that supports 4
>>> +              # streams MST.
>>> +              - qcom,qcs8300-dp
>>> +    then:
>>> +      properties:
>>> +        reg:
>>> +          minItems: 9
>>> +          maxItems: 9
>>> +        clocks:
>>> +          minItems: 8
>>> +          maxItems: 8
>>
>> Clocks have only five items, reg has 5. At least in my next from few
>> days ago.
>>
>> Nothing explains any patchset dependencies, so this makes reviewing more
>> difficult than it should be.
> OK, I found the dependency in cover letter (I was looking at wrong cover
> letter), but the dependency does not have relevant clock changes, so
> this is still wrong.
> 
Hi, 
https://lore.kernel.org/all/20250829-dp_mst_bindings-v7-7-2b268a43917b@oss.qualcomm.com/ 
dp-controller.yaml descriptions for regs and clks have been added. 
Compare with SA8775P, QCS8300 don't have DP1 controller which supports 2 
streams MST, so its minItems and maxItems clocks is 8. > I suggest to 
slow down with this patchset. It's v10 already with
> simultaneous other changes and two (!!!) dependencies.
> Sorry for that, will wait until the dependencies become stable before 
updating the patch.> I don't know how I am supposed to review this.
> 
> Best regards,
> Krzysztof

