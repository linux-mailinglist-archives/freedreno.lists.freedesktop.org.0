Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4EFBA3756
	for <lists+freedreno@lfdr.de>; Fri, 26 Sep 2025 13:18:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A240F10EA37;
	Fri, 26 Sep 2025 11:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BSUQ5OO1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF51110EA27
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 11:18:13 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8vhlx020770
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 11:18:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Eq9Zwf2rKiWBOFDTkcfFofQ9fiSbCfKkCk6e8JzUd+4=; b=BSUQ5OO1IXahVIuV
 Vn8Ku/wW88M79HlafbRzhLbeqlgfbsYTcgba0hO3JM4RJGdeUy59wHOEI50o1ePw
 9bWfmr1qmXKbOyzPbh7Nhf1oybSp49g36xYPjfD1H1bQqUs4D31V1sqdumkbJREa
 7xDKdPmo5XjjMS+ctOvkrYZqJ9SbwqEXiIY5ILTqiKZxxBPD4dAg5fkRhV8ZFhWK
 iGEZnV8piOhPbPhu5gsQj8W/Kk7HhuJAnLWKzXAHEQk9YWtRtpNGIGAEc0Ok/G7y
 vSjaSUoeWIV8kARA2y/DZ1FoO/wDPRK9sDHrywxChABlyRLNAsXA1jkNFW9Km1gu
 S5kp5Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0qtn66-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 11:18:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-85696c12803so82927585a.2
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 04:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758885492; x=1759490292;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Eq9Zwf2rKiWBOFDTkcfFofQ9fiSbCfKkCk6e8JzUd+4=;
 b=d6aPzzw6Ab5KM4K0dfqZWpMuNP/M8UloiVbWHYAx3XGakxvU1Y5umL4EPepv+tQLea
 TJfzKyeMXYHUlgZaQx/Xf5F6ciIAVXTTEmbYtXvcn4LVGgYMDNVKFCQfeZDI/2mlvXaR
 YyTsOcjHQDOwFz96+knRW8Awh6lZuuqr5GtgFXYzuApd0q4J/ifZW1GUfuC0pmyIiU7v
 8V6o31NydnC8QOAYjArqd1c56KsSwCKeI7FvEsjmSQw2kd8SavaMTMHEdkt2wd/mS0MC
 T9FQxycanCg6dpjiBYCBsxjn2HFXTcY/sfYaNT49j6MxCbaeC2lYGuBEI91bA40uDPCr
 27jQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTuplpBxur8ApmsPx5JnWRs/iVd08p0/kIAUGD9vGP3I/CYAktCyAOAARy9ZTLWgvZQSqmDhV5oN0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPwann1pSWr+Ef5l7CZQTWAKptTgzq9kQ3idE/lpDXRd1rZ7yS
 3QWUSoTkL5O26tUL4LIM7ri47YSVqMDcONVTht9ozBoEAYgfS6TTckJh9hbhKPgUUqYtBg7ANNf
 tBU3UNBVLU57nNvA5RBbsCokBrqVgpzvFQbgt4Vl1s9OH92CFz1ZjkQAdB6yAxrlBdqTaYjQ=
X-Gm-Gg: ASbGncu3l1bWEEgjHUm465XS4ziC0z47olf5DQl9HOjf5q8G34BPggry1CeUi64UOuS
 rZUS3xcSC2TPVOEIW4G8fN19uObR6fCX7pzRFR2aZFC3ENHXTkcfCZmerXmFMjPbr9v1RfzJQBN
 38u5poH803/7PrQCxhYLopqmM8yQSnAtKYD3RF9VaSNp5a39+fGKi2iO2eC4mSMnM9Nkh36biHn
 7+XHotwoZhjIBRfzeZmOqr7d2V+LEoH2s9QEWWUn73IYrkCjtVRBAdFYUfJo5MArWhOOutzjOa4
 nkRRvWvhehHkg8Whob1gTZNq0HmcpeYJix1ycs0mhDLEzQbYwENCmkA8k/JkCNGbHP8XRAWN+32
 4TzLKgTerpF++RdRbI3bdHA==
X-Received: by 2002:a05:620a:3182:b0:812:81c6:266c with SMTP id
 af79cd13be357-85ae6d81db3mr601251985a.9.1758885491722; 
 Fri, 26 Sep 2025 04:18:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTjabHhK02b9oVhzoCCGFrlmQKMMkgWl8q77/ykLbuE2cCJPi3DSQKHtmGntFz7aUmVpFMZA==
X-Received: by 2002:a05:620a:3182:b0:812:81c6:266c with SMTP id
 af79cd13be357-85ae6d81db3mr601248385a.9.1758885491079; 
 Fri, 26 Sep 2025 04:18:11 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b3545a983ffsm349631066b.94.2025.09.26.04.18.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Sep 2025 04:18:10 -0700 (PDT)
Message-ID: <652595ef-ef79-4c36-9979-b536ca65e1de@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 13:18:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/msm/dp: Update msm_dp_controller IDs for sa8775p
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
 dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
 swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
 andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
 jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
 sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
 alex.vinarskis@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_riteshk@quicnic.com, quic_amitsi@quicnic.com
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-2-quic_mkuntuma@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250926085956.2346179-2-quic_mkuntuma@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: d20YZGO1ufbQtkQsPhzRBUy3gGPeOO8D
X-Proofpoint-ORIG-GUID: d20YZGO1ufbQtkQsPhzRBUy3gGPeOO8D
X-Authority-Analysis: v=2.4 cv=api/yCZV c=1 sm=1 tr=0 ts=68d67675 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=tFSzMcqD3SoeBU5fSnoA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX7qGaTh8mRpPT
 eAp2rOAyhftyV6QmT3YMnzy0UQKOjTpDu2dM84MfK7nSOKvFCf/JKBM8ccHHL6KaMYp5pNBqUEJ
 hGzEeMUBSBEk+0f8k6bQmzfvIwNbhZrkPnkjt8amx1XolgZNu+HTbYuxltwwDP6m/gU98DMshFh
 uHYjLyDDJ2rJjR8OB2TNGkR/d357ylEg0vCxHjhOS1fVOPduZ6Sg+NYv2gcrKZ234VWjT//FiRN
 IGzabOi41/9H3laT9CopCFzATDsGoXV8wiITv+NSMfekpf9C1Cmk0THINb0cjJVuh8RfAzoVb5x
 hwEalAB9ej8YA0M81SpIMg79C9if4g2wOinKMK4dQk+it+cOgudDrvCC3SnxnosRMrXa0Z/YkXO
 i7xxd3OLuDAZm1A999vR1SFP5tcW0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_03,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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

On 9/26/25 10:59 AM, Mani Chandana Ballary Kuntumalla wrote:
> The Qualcomm SA8775P platform comes with 2 DisplayPort controllers
> for each mdss. Update controller id for DPTX0 and DPTX1 of mdss1.
> 
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index d87d47cc7ec3..f247aad55397 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -133,8 +133,8 @@ struct msm_dp_desc {
>  static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
>  	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
>  	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
> -	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
> -	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
> +	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> +	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },

Well, did you see what happens when you try to plug in a display
to a controller on MDSS0 and MDSS1 at once now?

(memory corruption)

Konrad
