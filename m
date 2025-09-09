Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E08B4A591
	for <lists+freedreno@lfdr.de>; Tue,  9 Sep 2025 10:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8D410E65C;
	Tue,  9 Sep 2025 08:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SamWdDe4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D51C10E65E
 for <freedreno@lists.freedesktop.org>; Tue,  9 Sep 2025 08:39:41 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5896T1UD023627
 for <freedreno@lists.freedesktop.org>; Tue, 9 Sep 2025 08:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TDpymrykwq2D9vEJfSPg+EEbvFuEeU+GWf9UCfxacp4=; b=SamWdDe4fTtbgA9R
 SvvGuYQtNjyLflZYkoug3yceJxrIesUeSQEEtWJrQJpvjQfSWzSIBlPsD5h6IQXx
 0IrbpslAYVraUSdlu828cic2BkGX0/LrZpbvFAFQ1tcaVYm1F4x9fGNo1xxcCOZy
 BCc5vCmrgUgOCn0uVBtO4YWExFS9Zist3V6gRtOnX8paRmBWFV1ToqtlAM3opInu
 eO4xORvJRD+ZsGS0bDSiWfSbwTzRI5zlNamN17RzZyD0D7CHI1tSq+UARJ7qVmqV
 M7L6upjLJifW3ToswczWfx+DxFTyrCZSaCzUozoELgOFR6xrKT+K/I5P5GNxCyQV
 IS2jfg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8fjrf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 09 Sep 2025 08:39:40 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-32b5f6d5292so1529828a91.1
 for <freedreno@lists.freedesktop.org>; Tue, 09 Sep 2025 01:39:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757407179; x=1758011979;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TDpymrykwq2D9vEJfSPg+EEbvFuEeU+GWf9UCfxacp4=;
 b=YyE21+pAHcPDHIMPbRGPo2OxYQYUF/cIOEXN+oTlF0UnJ6P8B9kt/f083s3ogmlPsc
 ob/HByCX5dTHEUTGrOnL/CHfg7VIH2IcMfHO8uGuosAld4muTppSCvHAd/xcagXNDtFh
 BsYPrME16d0UYHuGhtLlIZQ+0WrHweKvIAdqVZ3x6FGma71w+BMVKYwxn1DxtjR410f4
 3CUNXdm6ynJ5K5EN05Tc9rxlLxvDGvkVRden7pLc/siNllAI36kAa2aJCs+0YcuC0DBl
 dyuHqgLsB04Qfd7H3BKoo83ef9k0QvfbLASV3PiRFNVE+NRCPBh4XWF2eV5XokYo2bm8
 kIeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUn05zGCho+YSvn4C90WLziL0coyxgRJsXnYeKXkZgBEhTvI+eWuWOITe9mKC1S3sjdXWd2JiRz6HQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcRorTi6Sat+018fMzhYs9d358sflA8tVkKv9L2LvAVfXOWcOi
 Y0niGezN0Wx/Top985gGaQejGPboQdtkwd3kGrIQ5zAqlk0rY9NufSkk7zt1pZDEpUPOkSdr75h
 yl86ysoc43YuA4IH0Qb5H4d67vsCCsmR1El1xKVVmLREo2DOQ+AG2nxs5yp7ewAWTIbRuKfw=
X-Gm-Gg: ASbGnct2IEGQGB77VE58XsOfTFcQQcgHSKffQGgzhXQ75bI2UvinZgqF+aOYVG/qWyw
 mASG5hdmtElzEzN7yLc+6r/3NNkYIEgyl3GlobXsd4o/Onyu3dtPeXLs7ZLMzKbKDTlsnLhMW0K
 ONVpvSwGdWBAeRxfSYQev+drVu11SPp2dIID8DzFx0PZMnT2erk7keCTpcvdLnJzgeF62Xo2vau
 vLsNTXXDWajFSfnQeiOOyNeEeynVp2TuqsYpBAljTPV5GVLmrRmFuPaaXpFZHE3rEbs9ol+dQZj
 JzzaQx3qaQiImAzzMD0diMENgzr/6I8/QYyWCVpoWWOJ6fvJYeaLOZ92BQLbgosYpmAGyvkDqCB
 tQfGrgfzZcw74YA3eeqEkwURNOyky1A==
X-Received: by 2002:a17:90b:4a92:b0:32b:87ef:5faa with SMTP id
 98e67ed59e1d1-32d43f91aadmr7805307a91.4.1757407178394; 
 Tue, 09 Sep 2025 01:39:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7QbVcmVO7aZqm/k5QXoWRXC9zn0nVpx+dXw+04HHeABOWQ0WWeFhtm+A8ZDuAd6zzUqgtWw==
X-Received: by 2002:a17:90b:4a92:b0:32b:87ef:5faa with SMTP id
 98e67ed59e1d1-32d43f91aadmr7805263a91.4.1757407177787; 
 Tue, 09 Sep 2025 01:39:37 -0700 (PDT)
Received: from [10.133.33.137] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3276f57b227sm39403466a91.6.2025.09.09.01.39.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Sep 2025 01:39:37 -0700 (PDT)
Message-ID: <c4eeb8a8-2819-4ac5-8dc1-cce209d7cbc4@oss.qualcomm.com>
Date: Tue, 9 Sep 2025 16:39:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/14] dt-bindings: display/msm: dp-controller: Add
 sm6150
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-1-a43bd25ec39c@oss.qualcomm.com>
 <xurpc3mk5kksx7lfpsdqgasov5gc4dpsmz6iv2hjhsp5tewbue@dvrupbjzgxle>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <xurpc3mk5kksx7lfpsdqgasov5gc4dpsmz6iv2hjhsp5tewbue@dvrupbjzgxle>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX2S1zaW9+CQme
 Kkf7Pkk1nzPFOql36ohgvxUzzuE9pNVq9E5upR8ZxpxYbHUfhP65rlVspBOm3ewLaUs8NTsFz+M
 NcGx3SfJgKhW+0xaaDb0oX8jAJRtDqinXFtbipHCJyHzY0z5AzMSFvD+rRblicWFBCvRqQj6P4K
 pitqPGcX6p2znGtkwHCS9GChzZ4GCwEf0ex5OoElxri6jxswUHBQ5HHle54Kulh56V0BWAGC60E
 r27xHbFO/U6bqGKKPx0tR1C6ot+b2yLadVMf2MAJgUNyqh0yKNiXg2rBddjXcdLQRxTWwCpqGJm
 STropwTzwJLx4ASHUKHYMqJqR6oLn4wNc7LgV8eA9KFl9hXc9mF4U10Gb5+js/zyi2OEYvTO1jA
 roMwPoxi
X-Proofpoint-ORIG-GUID: 3_1lEaFwyFrm9Pr5f67Ikxk39JXVlFkR
X-Proofpoint-GUID: 3_1lEaFwyFrm9Pr5f67Ikxk39JXVlFkR
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68bfe7cc cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=tCOpKogST-nIjDDcSvwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031
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


On 9/4/2025 8:34 AM, Dmitry Baryshkov wrote:
> On Wed, Aug 20, 2025 at 05:34:43PM +0800, Xiangxu Yin wrote:
>> Add DisplayPort controller for Qualcomm SM6150 SoC.
>> While SM6150 currently shares the same configuration as SC7180,
>> its hardware capabilities differ. Explicitly listing it ensures clarity
>> and avoids potential issues if SC7180 support evolves in the future.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> index 9923b065323bbab99de5079b674a0317f3074373..996d0132e084d401db85014a1a4e445d00d62ed8 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> @@ -27,6 +27,7 @@ properties:
>>            - qcom,sc8280xp-dp
>>            - qcom,sc8280xp-edp
>>            - qcom,sdm845-dp
>> +          - qcom,sm6150-dp
> The DP MST bindings were A-b'ed and R-b'ed by Rob, so I picked them up
> into msm-next-lumag. Please rebase your patchset on top of it and
> resend. At this point I'm interested in DP bindings and DP driver
> patches, the PHY part can come up separately.
>
> As for the compatibilities, I think DP on SM6150 should be compatible
> with either DP on SDM845 or DP on SM8350. Please choose one which suits
> better.


Sure, I’ll split out the DP binding and controller compatible parts into a 
separate patch series.

SDM845 seems not support wide_bus, while SM8350 looks closer to SM6150.
But I noticed SM8350 is still configured as SC7180 under dp_display in
msm-next-lumag’s top, so this change will mainly about the binding, right?


>>            - qcom,sm8350-dp
>>            - qcom,sm8650-dp
>>        - items:
>>
>> -- 
>> 2.34.1
>>
