Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B31B3706D
	for <lists+freedreno@lfdr.de>; Tue, 26 Aug 2025 18:33:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE2210E391;
	Tue, 26 Aug 2025 16:33:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jsmTrUHG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A6710E392
 for <freedreno@lists.freedesktop.org>; Tue, 26 Aug 2025 16:33:33 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QCe1or007038
 for <freedreno@lists.freedesktop.org>; Tue, 26 Aug 2025 16:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=o0JNkVhBc++JdNPVvj2G5Tj3
 VEOgkLl+3jrDv6VD7BE=; b=jsmTrUHGvaBkNoJMv6AJPlvdxeSRoOXScDgdF8H5
 yXOY6bOIi/t8o01fuV9IO9u0u9bMxb1l21mNd+/Jb30e07scPF6cc/eWbSFWLTFd
 Q006RaI322lcHeEaHgQsi0TQBWmN+eszFaZZixyp+V3QvFqEJNb1j3LmONws8q4+
 +VzKEQ3vxORktU3MqJWeQTYwmkY1tNBSC0awih42NN4k7NxJ60O/5t23HT8aLGoO
 rxJiAeDAImklFPUzmy1ZwWGjzgCKlGXzt2h+HZBYdNfcJruN68YReBM2hNG+Ofx+
 LnHV77cIJplKO1g4jyBlcstYoQ3Pj5x1HXx1IfWYWGv1nQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5um9qwr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 26 Aug 2025 16:33:33 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70ddadde46bso7160316d6.2
 for <freedreno@lists.freedesktop.org>; Tue, 26 Aug 2025 09:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756226012; x=1756830812;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o0JNkVhBc++JdNPVvj2G5Tj3VEOgkLl+3jrDv6VD7BE=;
 b=ervK3Xteutn1+f81BRtbTny+u2Yin5kVaS13JdFgsp3aEdB2na4yMsBv6I2NzNudsS
 SMY/Kru0zhasjj13klFi02WQbr/gsNbviUK8wz1zEG3i3ZdN+5+9Q7CXcxdbbj9rz0RW
 I1dpsxRsUCxN4UXEp2GGCCNVtcWTRuZQ3F11QA5AmWlvbGjlP9AgUlF3QE2Hfglo4XO/
 zhtQQ34CNtUNUF8mP3ySO5cQCiAF8OKmiuTmGWADRJhEnqcJbZmM6oLRNlA8UzAFZHWh
 Lf1tce29BIQJNN6+W/aIsFtHePFq9YUl8juF2PENuG56lXcT/Zci4o6x1mDpK3E29Emz
 EAHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnoWTCRGkwKgbY18Q6ZkydfeEnC/esLklMCFSrXkAE9F2s6rl3b2mtRztgEVuCSJyEEid/+Yzo+ek=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygswHB+FmW2Su46fsunkyHKugnYfVEDjr5+MVbRzVDHTIJuvy7
 6CkfHhFbAIWpU9pKtNpVMeBa80pdo65inUoKX8V2r1F1Z64A1VB+6pyo9WmgUCDiWxeuWUMH0t4
 RuQ/63Xuojjo4UH/S1D3PrxepreZ5NhcHGygrS/eAJHM0LwJPffMajRcHk22XwrcDoqVL4vU=
X-Gm-Gg: ASbGncv8ej6R4n67lzrsa71UDimBJPioUjt1DArBoNFV0sHRBNLuqZFrGmK82ZwVPjq
 N7yHE67voJJ15A6S8WjRey4ZMHqvzh5dirxudN9mP+SbPSesH2bFqCJQy01sraT5ynLYmyobPYy
 upqsOmx+OyjqF++PwySD+Tuwjc2XrhWwQlajgezUkZdXWRl4m82SN1eFz8HjZcZ+t5iIxsBsQjb
 psNjo/ADrq/qOJdeL1xVz8P9Zc4qwYTHzSo1wiQjPkgsn8M7CfXywcHiJZBAJFyM2Q5WEwKOKMf
 MNhoCbmDb5LDSxy8hVCsIJ9KxYFlYgjlMVVFUYcT+p0t3fnhlTOzEA/U+tAEJNfanvVdxu018+Y
 16feu9mlBfRFqLX/La1TAiWePcUovmGIak6YHFrqkrUGHqz1vu+p4
X-Received: by 2002:ad4:5cc1:0:b0:709:ee07:daaf with SMTP id
 6a1803df08f44-70d97102f17mr190928286d6.19.1756226011453; 
 Tue, 26 Aug 2025 09:33:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZ7aaOomBumnrq1rhi9jEEdDGg0wr1dDNic05npTTurzd/gV21cCPu8vrLKpDQ36ehil5Qyg==
X-Received: by 2002:ad4:5cc1:0:b0:709:ee07:daaf with SMTP id
 6a1803df08f44-70d97102f17mr190927636d6.19.1756226010771; 
 Tue, 26 Aug 2025 09:33:30 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35b27683sm2357303e87.0.2025.08.26.09.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 09:33:29 -0700 (PDT)
Date: Tue, 26 Aug 2025 19:33:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 27/38] drm/msm/dp: add dp_display_get_panel() to
 initialize DP panel
Message-ID: <smvfckejheyi7oehubdkhnh6pxokn7yugvlrynraypsu6kssj3@6vinswn4yku4>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-27-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-27-01faacfcdedd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68ade1dd cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=qYs0ZBLfSisuqDwih3YA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfXyMoVj2Yj8Ogc
 15w/VtcipTBRz5VZaJPLRhPmkRpEwKPuIP9VLSg0qqrPiKHxMZcEYLbkmIWlVkxgWvlkHmhYp0G
 dnRS2Kdm2zD+FmKh0VxrFIHWszBT3R66a6AfW7EtPjjRUM0jHd4/NzgELxYySC0agE6/dGaEXsK
 eFo2CO3qsb2z56TQvIWRSe/PkNy9xQz3WdeXnLkAKzvEccuFSEIUvzxs1zvQXafh/zJFiOFRFXP
 wUL0DkGii1N4fRHDgxkp5djkukIWtML31SFRWRJC38KhBBTA9BMZPv8ttBw88B/nrNIoK83/kyE
 PHFp3CnT/dzD7KrczZyE4kXU4XDt9e0p0xAwNx269qYP5+Wx3FDIUXYN/321krrsfV4ibB8Jb0e
 VlZeuNkR
X-Proofpoint-GUID: iO0gbAPXvDuZZ3K9UrZBt0Y66_vyd8RO
X-Proofpoint-ORIG-GUID: iO0gbAPXvDuZZ3K9UrZBt0Y66_vyd8RO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032
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

On Mon, Aug 25, 2025 at 10:16:13PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Add an API dp_display_get_panel() to initialize and return a DP
> panel to be used by DP MST module. Since some of the fields of
> DP panel are private, dp_display module needs to initialize these
> parts and return the panel back.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 23 +++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_display.h |  2 ++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 84df34306fb557341bea288ea8c13b0c81b11919..abcab3ed43b6da5ef898355cf9b7561cd9fe0404 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -632,6 +632,29 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
>  	return 0;
>  }
>  
> +struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display)
> +{
> +	struct msm_dp_display_private *dp;
> +	struct msm_dp_panel *dp_panel;
> +
> +	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
> +
> +	dp_panel = msm_dp_panel_get(&dp->msm_dp_display.pdev->dev, dp->aux, dp->link,
> +			       dp->link_base, dp->mst2link_base, dp->mst3link_base,
> +			       dp->pixel_base);
> +
> +	if (IS_ERR(dp->panel)) {
> +		DRM_ERROR("failed to initialize panel\n");
> +		return NULL;
> +	}
> +
> +	memcpy(dp_panel->dpcd, dp->panel->dpcd, DP_RECEIVER_CAP_SIZE);
> +	memcpy(&dp_panel->link_info, &dp->panel->link_info,
> +	       sizeof(dp->panel->link_info));

Both these lines show that link_info and dpcd belong to msm_dp_display
rather than the panel. The panel should only be describing properties of
the particular sink.

> +
> +	return dp_panel;
> +}
> +
>  static void msm_dp_display_deinit_sub_modules(struct msm_dp_display_private *dp)
>  {
>  	msm_dp_audio_put(dp->audio);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index b1ea027438d952c94f3ae80725c92e46c631bdb2..d5889b801d190b6f33b180ead898c1e4ebcbf8f3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -65,4 +65,6 @@ void msm_dp_display_unprepare(struct msm_dp *dp);
>  
>  int msm_dp_display_get_active_stream_cnt(struct msm_dp *msm_dp_display);
>  
> +struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display);
> +
>  #endif /* _DP_DISPLAY_H_ */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
