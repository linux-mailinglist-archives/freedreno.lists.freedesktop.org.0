Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DB5B9B9AB
	for <lists+freedreno@lfdr.de>; Wed, 24 Sep 2025 21:11:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9812910E255;
	Wed, 24 Sep 2025 19:11:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IRuWZS8N";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE6D10E7C2
 for <freedreno@lists.freedesktop.org>; Wed, 24 Sep 2025 19:10:58 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODDJQ4002135
 for <freedreno@lists.freedesktop.org>; Wed, 24 Sep 2025 19:10:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=gStCkt/BoSYEmirqxpf4aupt
 Sr4no9aDnWgPhyHC9mc=; b=IRuWZS8NerPXaF9QsvZ4So1O+3CYZ/fEgZ44Z5O5
 IzATCWJ1GkG6Yc4QbClhAzV4sOpQ3gkFZpFOeE6SQjoIgOptProGW4h24U2FJ5I7
 9vM9kO1jfJYXgDi2X22VYV/L+MxHBJaq+b7DUmhTMVKQziNSZl1LGdNWMdQbdiFL
 RSOvRGwQnJYT8h4wjKLmgaHPPBDuk26Dd6PXjDqyFZW8VCDhMEYOuksaTe7lbFfB
 EOciyHZIDyIK26I+9iLOsNPsGVD6Sz6Wg8TYvSsogOkN3qEFlKQc/mjEAqco7r1k
 ovYZzorP012bnVTz7yULavERIdssV9BbA+NKTlwbs1qDTg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98ngp4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 24 Sep 2025 19:10:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b7ad72bc9fso4154611cf.0
 for <freedreno@lists.freedesktop.org>; Wed, 24 Sep 2025 12:10:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758741057; x=1759345857;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gStCkt/BoSYEmirqxpf4auptSr4no9aDnWgPhyHC9mc=;
 b=H8yV/Y17uwQH2VLw1PL/qOAsymUAfDgsAXZ6RNzmC2QpvhmgnrugR59WFClmPgU6lD
 wIyIv0wEVtzdDuCPYY2e0bgmRifSsujUW+icUA3eLxheI5tgx0LLzoI8YEggc+7ii+5e
 /9ZzS1KR8Xtf+Uj1/sMKDnUXODeVepIqSOHFvUONFxrsUGOj7yCbUDSgwrX67yt0wbSv
 6hwHIswnf+uRezmQO51BTvd/F3PczDmGk3AFfYzWOwA4lym8SDy5y+xgL9GjKqHF67Rl
 EGQe1+QFEwyVteZOPhxSigG8g6wdAf3g2PGwFrQyMI1Md0ZRXhuYDwiHZZBtZC1ypGT1
 IiUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVehV/uIi4njmMRyvSTJlS3FhQqwHtlIxllqNKoqolIrQTwEm9QCwsszKdLKZ/HfUiDCDBAyV4cmQU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxl2wKniy1PmyuUKsHscLSZwwfzpSiq8XKUUwSlhfniG6ySovzo
 JO1oi867/c57TJVz9/e+3UlpzRvcNDtZWgWZRHIFD5G2onhBys73pgmWriwwYvQS/Gu243VB+Mz
 yK/pHjNczpd/q587jk8szWcoPOpq/aGNrxt/7vj40cSIM1861fD/RSnY+5NoGDm1/vtZoigY=
X-Gm-Gg: ASbGncu0+s3Uv1uWJPe20sIvI98P9Wx5S+DDBPka+qCJ6aWU58I842g0R2pwICs+yxZ
 y7cQyltQjqt25oa+vslkA8F3GOzDyxuF92ty5ZmRSKC7ITd0dEuTmlr8TL6vz47go6+gWCNUv4A
 75OycdymPMCCwKv73fdHzRnc2Llrvu0/uW64nBk+f+cq7/94ym4rSuJVtmMq4gfjlf0OO751rl7
 mSBjTGA8cq81I9jceIFjU1WklSz0wohCLumKvTbFPxUVLa5+TjFg0+3C3HTNBmgdTNqlMstSOeO
 r/Szyjl3mSfkK6DFcjJRuYglhqCO8cmTYPRLT5uDaIabZbIP/+9QR+wUYsT/2Zk853tKSZ5M2U0
 y4LjvXDqIVMi6rZ37CurfKc41LrSl4hygmghLjx+KjYWnlqBA+UpY
X-Received: by 2002:a05:622a:610d:b0:4b5:d932:15d8 with SMTP id
 d75a77b69052e-4da481d8f8fmr12584691cf.14.1758741057092; 
 Wed, 24 Sep 2025 12:10:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzNGVdhq6dBp/1CJfwzM4ALe/HzWywBrHP1da/RaRRmjp3ldIoFiEOTag9sj83H/4xzDV3xg==
X-Received: by 2002:a05:622a:610d:b0:4b5:d932:15d8 with SMTP id
 d75a77b69052e-4da481d8f8fmr12584151cf.14.1758741056530; 
 Wed, 24 Sep 2025 12:10:56 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5790a9f0368sm5026655e87.55.2025.09.24.12.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 12:10:55 -0700 (PDT)
Date: Wed, 24 Sep 2025 22:10:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v3 1/3] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
Message-ID: <5b75dckankcx55gbm734a23rvqxdbprlus3nkvqfry7lz5ksjf@jjmfsbiwqny6>
References: <20250924-dsi-dual-panel-upstream-v3-0-6927284f1098@linaro.org>
 <20250924-dsi-dual-panel-upstream-v3-1-6927284f1098@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-dsi-dual-panel-upstream-v3-1-6927284f1098@linaro.org>
X-Proofpoint-GUID: NW_C8uSH0EoChooW6b3khAVho5mGDOE3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX9akTZHn39pfG
 uN2+dg6jxK7yk7MJLspOuWhU7Xiopclrwlg3vX9XVb0+QYbiFy7+zcSsvW7ITM15oFM8aWQn2e6
 Cq4d9IpQfdsGAfHD6seh8M7dd6TkAaE2Q9y54aBwJ691mysfMdPOlgZJY0KxiK1jpU90LmruLe3
 Ht1xik2c5/REx71FvsC+6vTB2ac5MA7TApS5K1AOcVIHKodMHBAD/VjW6MDkV+xfuQ7mF+xJYQT
 /K4lqKnf4sxyuz7JSnRuOJkDbG2KemUp8/GwxLOQuO6Cr2oHJFtXMWWpFUJZHw1BkJ9femxzcL3
 IoXpnd5ujHFZCZJATipNsAJ946TR9cdQ1cG1LcQGMvbDh5Ca0/5V5cAHoGLlHd4n+FCBan9R1Ez
 v1WSr42R
X-Proofpoint-ORIG-GUID: NW_C8uSH0EoChooW6b3khAVho5mGDOE3
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d44242 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=RAbU-raeAAAA:8 a=KKAkSRfTAAAA:8 a=TDLR0dRR3mayGEnoOkYA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=JiizpSU_mAIq9zsZDqn2:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_06,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018
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

On Wed, Sep 24, 2025 at 11:08:10PM +0800, Jun Nie wrote:
> Some panels support multiple slice to be sent in a single DSC packet. And

s/support/require/

If the panel supports something, then we can omit that and send 1 slice
as we currently do. If the panel requires multiple slices, it's
mandatory.

> this feature is a must for specific panels, such as JDI LPM026M648C. Add a

A panel driver which executes this API is appreciated. Otherwise in a
few months / years somebody will submit a patch 'field foo is not used
by the kernel drivers, drop it'.

> dsc_slice_per_pkt member into struct mipi_dsi_device and support the
> feature in msm mdss driver.
> 
> Co-developed-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 25 ++++++++++---------------
>  include/drm/drm_mipi_dsi.h         |  2 ++
>  2 files changed, 12 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index f297e3de8c3dc4e1326e70c78c046b5a19568cef..de51cb02f267205320c5a94fc4188413e05907e6 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -157,6 +157,7 @@ struct msm_dsi_host {
>  
>  	struct drm_display_mode *mode;
>  	struct drm_dsc_config *dsc;
> +	unsigned int dsc_slice_per_pkt;
>  
>  	/* connected device info */
>  	unsigned int channel;
> @@ -849,17 +850,10 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>  	slice_per_intf = dsc->slice_count;
>  
>  	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
> -	bytes_per_pkt = dsc->slice_chunk_size; /* * slice_per_pkt; */
> +	bytes_per_pkt = dsc->slice_chunk_size * msm_host->dsc_slice_per_pkt;
>  
>  	eol_byte_num = total_bytes_per_intf % 3;
> -
> -	/*
> -	 * Typically, pkt_per_line = slice_per_intf * slice_per_pkt.
> -	 *
> -	 * Since the current driver only supports slice_per_pkt = 1,
> -	 * pkt_per_line will be equal to slice per intf for now.
> -	 */
> -	pkt_per_line = slice_per_intf;
> +	pkt_per_line = slice_per_intf / msm_host->dsc_slice_per_pkt;
>  
>  	if (is_cmd_mode) /* packet data type */
>  		reg = DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(MIPI_DSI_DCS_LONG_WRITE);
> @@ -1008,12 +1002,8 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>  		else
>  			/*
>  			 * When DSC is enabled, WC = slice_chunk_size * slice_per_pkt + 1.
> -			 * Currently, the driver only supports default value of slice_per_pkt = 1
> -			 *
> -			 * TODO: Expand mipi_dsi_device struct to hold slice_per_pkt info
> -			 *       and adjust DSC math to account for slice_per_pkt.
>  			 */
> -			wc = msm_host->dsc->slice_chunk_size + 1;
> +			wc = msm_host->dsc->slice_chunk_size * msm_host->dsc_slice_per_pkt + 1;
>  
>  		dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
>  			DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
> @@ -1623,8 +1613,13 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
>  	msm_host->lanes = dsi->lanes;
>  	msm_host->format = dsi->format;
>  	msm_host->mode_flags = dsi->mode_flags;
> -	if (dsi->dsc)
> +	if (dsi->dsc) {
>  		msm_host->dsc = dsi->dsc;
> +		msm_host->dsc_slice_per_pkt = dsi->dsc_slice_per_pkt;
> +		/* for backwards compatibility, assume 1 if not set */
> +		if (!msm_host->dsc_slice_per_pkt)
> +			msm_host->dsc_slice_per_pkt = 1;

msm_host->dsc_slice_per_pkt = dsi->dsc_slice_per_pkt ?: 1;

Yes, I think it's more ideomatic.

> +	}
>  
>  	ret = dsi_dev_attach(msm_host->pdev);
>  	if (ret)
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 6d2c08e8110151a97620389197f1ef79c058329d..5a85ba01f402a3866b70828391bb417bb8dd5956 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -182,6 +182,7 @@ struct mipi_dsi_device_info {
>   * be set to the real limits of the hardware, zero is only accepted for
>   * legacy drivers
>   * @dsc: panel/bridge DSC pps payload to be sent
> + * @dsc_slice_per_pkt: number of DSC slices to be sent as in a single packet

s/as //

>   */
>  struct mipi_dsi_device {
>  	struct mipi_dsi_host *host;
> @@ -196,6 +197,7 @@ struct mipi_dsi_device {
>  	unsigned long hs_rate;
>  	unsigned long lp_rate;
>  	struct drm_dsc_config *dsc;
> +	unsigned int dsc_slice_per_pkt;

Why is it a part of the DSI device config? What if a device specifies
dsc_slice_per_pkt, but not DSC config? What are the legit boundaries for
this field?

>  };
>  
>  /**
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
