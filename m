Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 096E1D2367B
	for <lists+freedreno@lfdr.de>; Thu, 15 Jan 2026 10:19:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B5610E70D;
	Thu, 15 Jan 2026 09:19:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MhNRUBH8";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TngFWoaA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07DE610E70D
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:19:33 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6fxG31991697
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:19:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pURHtbp6VGKQeBQ/ldaen2l7gcfocWJuNey1NSuLoXc=; b=MhNRUBH8bvXRD6RZ
 ndIGPioDTeOHk0+CbIlS2sv7nj5KZRutmkVj5eprDgbygh7I1s2chnQW43pSv5Zv
 BjjTDnKRl9Def9ZPsAZfutqQBIcfhKO7enhGCtufkU8+JZwONHdk56CUIyMInfPO
 hHwcfmBfNnS7iBZVYm29ojxzPRW8GhIbxSai4Rx/U+anzDmVNF/UV2HYMpGLaDx1
 mXm79nAF0DazHGE5qLp7VsImtysj3slenQbZ8sNDw8RWoynkgYyus/NJTG09Ec8P
 TetSGZIUfTV+13+3WuO1ZRQpXpPXNELSL2S57lMZA3WckylJEbuqoZR8NWsfmWME
 vjuzyA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbdbucd4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:19:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c231297839so22205485a.1
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 01:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768468772; x=1769073572;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pURHtbp6VGKQeBQ/ldaen2l7gcfocWJuNey1NSuLoXc=;
 b=TngFWoaAcX85Bcq07jH0796lLTP0H1HtAE4O4kFXUyIYgSyTmJKJjezXXZ01OD7nz0
 +IWDN3dPXqaWPnD038r1AvX6C7rS+Jq87NPn/Y2XBLRwLHW1gPMjRzQ0ATr/hAJoCGR5
 6elcZTN3dBb8oM8LIZ2m3itJFzmkaINr2gz/pzCCsz18psv18pwDTZ5tTKnN++RuQC/7
 CXXWOgfhSVTPkfYJWunqURQzBETDBhNXj9pcpDVvH7KrEAHIRVJgiG3wfl8hDBh7uZ2H
 F3aNdepA+aeYEeZ3745sREazqj0W8u6mfXdH28qoUOdn7R2m5ZklPhbeKAYIPn3P6EG7
 kgbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768468772; x=1769073572;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pURHtbp6VGKQeBQ/ldaen2l7gcfocWJuNey1NSuLoXc=;
 b=Bj43tHz8yhpI8kbMfUe1pxoMMwvLVILK4AiQi2DsO5H53DMS4wi99/e7XwUZB6/y0b
 73heWQGo9bufcG4/nEqYpLJ5p1jPnDa7OKwTjWKZVE71mwh7DyprngpFzUxLicvn76WX
 j5g0MSlF7a1YGMwmdk+hugY5Lw2yL1PN176sE2K9yxR0y7IGTXL2INRngp2Ly8fS0bza
 vRYWsmZnSIoEo6s5e3lvwS1/AUxdzVD3f/zlgWorKMVhnksXkKWjD3M0FLiTmowG/O2h
 ywpAJpnZj6yDPCrwv2GUaaquVqIzt1QNAqG0VhLWM+G9W/tZDoyz0f7F6WsQFEqYRBoD
 M2wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9ISCSgE6ZioPa6FAho/R42I5TaO6JFkmlH3s5xV6OprxywdUQEu4C+bbhyUWBa/75j5C63Qp0du0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5nO888SHnZhpW0BI0AHJiB7M500TcvLevVht50rdAJ8VL6f0z
 cAVD+cH6Jhalfmjjg70aBCXbucqkV1tB4gwR6t5cvzyvvmw/ZSzhRLiAJBeTiMpXlXX4BrU9NZX
 83Ytr7BbDX2Onr4xLfLHNsE+xd+9+YCT8YnirAj7ebuSgirv0lqc2Kqs2RBz0+6RDrZ0x6SE=
X-Gm-Gg: AY/fxX5n/E0c/hphZlAc2PVyhQIF94VCDDhlHoLY6L11yvm53mAMKgrpxlV+moZ+R/N
 HDDA7ZQ8QfBZUyqIw9Ykb0/17rAn8ejAww7UwdHYSb61kWsfupQT1fOFSwGCZYd3vS3aMVWoU59
 ZNzQ6gbiAvspe0qpjZPz4cBJ3Vik6evGgh3VRysTcKI9Rx1lbdsdSu54C1oy6m3GiYmtV9dUb1x
 t2tWNtnzqcvsgAPtlG6xcT2ddipWghgms+ONgdRvtIF8/MhAH1Q79GPX8Fqg/TrNHuSOiCCQaLL
 9nzyQMfnjtv4AehSBdaS50b+8+gjnNkduiRSovOEmqnXa3GxcTuOgeRrV3wu710MeprV6iWV1j6
 q6Lgxb6hzv5jN//eEiAbbIoebJxNYoKZJGZmSV5XaCKioApXXeWkVWVrzH7ldnOj0vhE=
X-Received: by 2002:a05:620a:4154:b0:8c6:a22b:e11c with SMTP id
 af79cd13be357-8c6a22be2c5mr48272785a.1.1768468772082; 
 Thu, 15 Jan 2026 01:19:32 -0800 (PST)
X-Received: by 2002:a05:620a:4154:b0:8c6:a22b:e11c with SMTP id
 af79cd13be357-8c6a22be2c5mr48271185a.1.1768468771575; 
 Thu, 15 Jan 2026 01:19:31 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6541197fb4asm1869724a12.15.2026.01.15.01.19.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 01:19:30 -0800 (PST)
Message-ID: <d826de45-f00c-4af8-947b-246362c2be23@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 10:19:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] drm/msm/dp: Read DPCD and sink count in bridge
 detect()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
 <20260115-hpd-refactor-v3-3-08e2f3bcd2e0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260115-hpd-refactor-v3-3-08e2f3bcd2e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NvncssdJ c=1 sm=1 tr=0 ts=6968b124 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=iwLwdXV_GrZBMsYiV9oA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: q113WpuRSoeW6wZHta7Zj1k9DRYaOhdR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2NCBTYWx0ZWRfX9OCh4KN4X1PE
 BjbYC9Kgm4JfRqqt96c6bEcALIi6PQTtd0FQHl/pkyCYxOiocACXigE8UsnJRgtSTvGgUrjw4cZ
 3BiBJgRqywNWsMLR+Sk6Fw3QuA8zJi+c6sxz4cytSmQ6osu6C9tgAs2upEoA0XRBYeZNAg06nRd
 Db70pPtAKnD2ZY7lGsGK0iIl9PvvdkWZk6xs7dg2yrOnmwKsifLFN9DRRcamI7G9rQSi4kQsqOK
 uroOAF48TRTASRIFj5k6tsM2d85pYFDUAiDXAToSAnqZY8vcYPzCks+IdylyvrY1dThbNDek4XH
 Bnm2JjeHJ8SxUUCEoPUQQDXpWvp0a1/Ena97K/yy8b4CHzeFjhntNcbAS7jAUudyDJkUFmtEjS8
 C4RXq6YSOVCnM/KzidQBnubvm+H5bL1HbcnXnGafYNv185z2c0FL3iJj53iNHqyLat5r/AETMYM
 bFqtkLDpwU9hh3M3Nig==
X-Proofpoint-GUID: q113WpuRSoeW6wZHta7Zj1k9DRYaOhdR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150064
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

On 1/15/26 8:29 AM, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> Instead of relying on the link_ready flag to specify if DP is connected,
> read the DPCD bits and get the sink count to accurately detect if DP is
> connected.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 60 +++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_drm.c     | 20 -------------
>  drivers/gpu/drm/msm/dp/dp_drm.h     |  2 ++
>  3 files changed, 62 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 5997cd28ba11..a05144de3b93 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1151,6 +1151,66 @@ static int msm_dp_hpd_event_thread_start(struct msm_dp_display_private *msm_dp_p
>  	return 0;
>  }
>  
> +/**
> + * msm_dp_bridge_detect - callback to determine if connector is connected
> + * @bridge: Pointer to drm bridge structure
> + * @connector: Pointer to drm connector structure
> + * Returns: Bridge's 'is connected' status
> + */
> +enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
> +					       struct drm_connector *connector)
> +{
> +	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
> +	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
> +	struct msm_dp_display_private *priv;
> +	int ret = 0;
> +	int status = connector_status_disconnected;
> +	u8 dpcd[DP_RECEIVER_CAP_SIZE];
> +	struct drm_dp_desc desc;

Reverse-Christmas-tree would be nice 

> +
> +	dp = to_dp_bridge(bridge)->msm_dp_display;
> +
> +	priv = container_of(dp, struct msm_dp_display_private, msm_dp_display);
> +
> +	if (!dp->link_ready)
> +		return status;
> +
> +	msm_dp_aux_enable_xfers(priv->aux, true);
> +
> +	ret = pm_runtime_resume_and_get(&dp->pdev->dev);
> +	if (ret) {

See ef8057b07c72 ("PM: runtime: Wrapper macros for ACQUIRE()/ACQUIRE_ERR()")


> +		DRM_ERROR("failed to pm_runtime_resume\n");
> +		msm_dp_aux_enable_xfers(priv->aux, false);
> +		return status;
> +	}
> +
> +	ret = msm_dp_aux_is_link_connected(priv->aux);
> +	if (dp->internal_hpd && !ret)
> +		goto end;
> +
> +	ret = drm_dp_read_dpcd_caps(priv->aux, dpcd);


> +	if (ret)
> +		goto end;
> +
> +	ret = drm_dp_read_desc(priv->aux, &desc, drm_dp_is_branch(dpcd));
> +	if (ret)
> +		goto end;
> +
> +	status = connector_status_connected;
> +	if (drm_dp_read_sink_count_cap(connector, dpcd, &desc)) {
> +		int sink_count = drm_dp_read_sink_count(priv->aux);
> +
> +		drm_dbg_dp(dp->drm_dev, "sink_count = %d\n", sink_count);
> +
> +		if (sink_count <= 0)
> +			status = connector_status_disconnected;

< 0 would be an error coming from drm_dp_dpcd_read_byte, should we log
it?

Konrad
