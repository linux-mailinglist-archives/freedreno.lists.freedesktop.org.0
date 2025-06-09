Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B993CAD22F4
	for <lists+freedreno@lfdr.de>; Mon,  9 Jun 2025 17:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BCD10E3AE;
	Mon,  9 Jun 2025 15:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="a8DfLomd";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C71610E3AE
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jun 2025 15:51:13 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599KOQU011931
 for <freedreno@lists.freedesktop.org>; Mon, 9 Jun 2025 15:51:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=K+GJtEmFeWWV7acoRA4FQCe7
 suMJMwpWj1BE28bV0Ww=; b=a8DfLomddNxsdSt1oNauMa1WiRDQR41rKMnCrldL
 mMbZS+/IXuFye+VD9bJ5A3IPH0PIk9ZQHS2pl/42durVPDVZ/+Slzt0/1CgxMQNz
 ZE56kus+FBFoFT0dtvQfc1fqdoKOohjkHS0Dp/N3XVkir9lTVPCCIQBN1XhG6Qi7
 0ZRCMWQuFPXeLhfBn3/5iu3r9ybN6c7566IQQH+4FMAIXLBzwDiZOMSfFbuXgvev
 HxJKMfB5c/08YpfcvkEbyOGViDnCJtNHpikWGLb0dVihNutLnZmd8YBDa/pVPQcG
 n0XufbzxXfYwKdep1aENBv997oPpLuuIi/vcS3U89Q0Xcg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekpp8wj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jun 2025 15:51:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7caee988153so754309185a.1
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jun 2025 08:51:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749484271; x=1750089071;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K+GJtEmFeWWV7acoRA4FQCe7suMJMwpWj1BE28bV0Ww=;
 b=xMdssbu94Fqmsiec1bcy4A36TUetcngqgj3eqIR+X0fi4l2nLYzQX2yo8VOLQMrdU3
 RviABLzz3C8EdyfuLA4ovqu6r3DDPPSB2fXtAWZujtlm7IBSekZphB+vaf77pUTKMm/J
 +4D2avrb6n9MNRK8cNThG7ydb6hEfeUq8j1hUpxm16ZXeMRGfcDffFL/99LX0gFSXxJS
 8bJlncs0lrSshgSLiV48eiygSyj68xUr5lk25+2mCx22NbsPklysl5rZwbg1IPDvUZUD
 NmikzmPwJGdchPs4U6NGlZoC3d4K1mQBHiCID2dE3JmX/GfEnGjlHtFjPkDuy8bsov3U
 p8mA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOz7IM+79TXqbaDS03fsiyq0eixSBhgX2E88MooYSr28UH8V011IcYppBJDtYtJXKV8isbhgubcKc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2sKYZbIgB7ORRE53YmlgWmNvN350ltvv5a5E7f6DvXpNDl35y
 UbZ8T6uwInjP5wfan+RWFX7JCcsDotHG/JCXc+HQnND/JjN9NMQMt18i27lrjaFUEOQ+hFL4M2C
 c9cYxUmAehkCGn3UP1M683RuW2LvRa0QCVAj0qzxfK6I05oYhyePBc3fmNDALCQzZG0ERAPA=
X-Gm-Gg: ASbGnctUxNhAFB7MzuE0szVb2SrwgiqEqDrqHniNV894G21dycPyhOy7LHXLdkHOS8D
 ndu2OIeg61+3KlTvFWNYM2NSnvpD4B/CN9ga0ipdilcER6UUFMxajr27sy05gQgx6LlMySXnExu
 Svzz6OGVKImv7MkUurftir3vQHccuzSwOse6TkDfgCOGMLPDBgEl837L2I8XP41ELJOrOV2nn9x
 MoxAnmwNymzG6SdbMdpobidU+0SP7Hdz0KptwK8mm0GrXV5q2he7kh0wJ0qW9weYPbhPjUnniqP
 gKy+MvdI8z49aTJEHXwmI/z/CCr6ZQsYG+FfINbn8iHFIbE0cLSoLeM+Cog6cdo4N3zil2xR/VP
 zfijB9hnqAQ==
X-Received: by 2002:a05:620a:2694:b0:7c5:a41a:b1a with SMTP id
 af79cd13be357-7d22985b912mr1886685285a.10.1749484271300; 
 Mon, 09 Jun 2025 08:51:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkgTWv8MC/AitIaS/DA4ob4l3D99JLGsatSu5WEducw95bQhwsH7AW9Oj21iwH8CSCiLhHEg==
X-Received: by 2002:a05:620a:2694:b0:7c5:a41a:b1a with SMTP id
 af79cd13be357-7d22985b912mr1886681885a.10.1749484270922; 
 Mon, 09 Jun 2025 08:51:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5536772a817sm1205198e87.171.2025.06.09.08.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 08:51:10 -0700 (PDT)
Date: Mon, 9 Jun 2025 18:51:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 29/38] drm/msm/dp: add connector abstraction for DP MST
Message-ID: <fcmbo5qhiifo3erfnejgtu6es2nmeo3c5r4plbutj23gdtydng@xy3mqkhbsjia>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-29-a54d8902a23d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-29-a54d8902a23d@quicinc.com>
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=684702f0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=BF5CnLKeIFxmMbDrz1YA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDExNyBTYWx0ZWRfX9/cMjHXst3rs
 hKvHuVqRqcaJk8hEZQwQyICEC7XxKCNdjvYwrfM26zMgxfZsi0FHdiDoTBjpOvfChGnPidNvwpm
 zn1MU2OYuzIwqeraNJmgCe7ktA5eIv5ZSEki67b+aIKNrx3s/t42Dov5opFfBMqTPyM7Rf252/g
 TxpQL0UdyFWBjeVz8I/OECw2PstW7zulY1XZKlaRjXzA+LH1iSTHSlIZNVfVhROrGN7fwvNsjmQ
 t7D2jTdHRY2D1OTaoZSRjMwbiFta7+b4DCZAFDllHFGVYyFGnwmMn0i3wS4ARth+i7XuZUw5tPc
 /ZCTplcjcBGrmSWnG17BPfmwfp+jylzp+HDcxLkq6UbUy25xSbZBu4UxorNpNC1F7jsLnI+uUrh
 ydyyF26q74pZ2TLU7zihV4lBqaU8dzkxawmJmsSW+59x9WHeTq56/hpe7DeCLEsGSh9In29y
X-Proofpoint-GUID: qOj_cH_UnJTmi9fGXSD_l2DrwtbXpuI2
X-Proofpoint-ORIG-GUID: qOj_cH_UnJTmi9fGXSD_l2DrwtbXpuI2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_06,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090117
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

On Mon, Jun 09, 2025 at 08:21:48PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Add connector abstraction for the DP MST. Each MST encoder
> is connected through a DRM bridge to a MST connector and each
> MST connector has a DP panel abstraction attached to it.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_mst_drm.c | 515 ++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_mst_drm.h |   3 +
>  2 files changed, 518 insertions(+)

> +
> +static enum drm_mode_status msm_dp_mst_connector_mode_valid(struct drm_connector *connector,
> +							    const struct drm_display_mode *mode)
> +{
> +	struct msm_dp_mst_connector *mst_conn;
> +	struct msm_dp *dp_display;
> +	struct drm_dp_mst_port *mst_port;
> +	struct msm_dp_panel *dp_panel;
> +	struct msm_dp_mst *mst;
> +	u16 full_pbn, required_pbn;
> +	int available_slots, required_slots;
> +	struct msm_dp_mst_bridge_state *dp_bridge_state;
> +	int i, slots_in_use = 0, active_enc_cnt = 0;
> +	const u32 tot_slots = 63;
> +
> +	if (drm_connector_is_unregistered(connector))
> +		return 0;
> +
> +	mst_conn = to_msm_dp_mst_connector(connector);
> +	dp_display = mst_conn->msm_dp;
> +	mst = dp_display->msm_dp_mst;
> +	mst_port = mst_conn->mst_port;
> +	dp_panel = mst_conn->dp_panel;
> +
> +	if (!dp_panel || !mst_port)
> +		return MODE_ERROR;
> +
> +	for (i = 0; i < mst->max_streams; i++) {
> +		dp_bridge_state = to_msm_dp_mst_bridge_state(&mst->mst_bridge[i]);
> +		if (dp_bridge_state->connector &&
> +		    dp_bridge_state->connector != connector) {
> +			active_enc_cnt++;
> +			slots_in_use += dp_bridge_state->num_slots;
> +		}
> +	}
> +
> +	if (active_enc_cnt < DP_STREAM_MAX) {
> +		full_pbn = mst_port->full_pbn;
> +		available_slots = tot_slots - slots_in_use;
> +	} else {
> +		DRM_ERROR("all mst streams are active\n");
> +		return MODE_BAD;
> +	}
> +
> +	required_pbn = drm_dp_calc_pbn_mode(mode->clock, (connector->display_info.bpc * 3) << 4);
> +
> +	required_slots = msm_dp_mst_find_vcpi_slots(&mst->mst_mgr, required_pbn);
> +
> +	if (required_pbn > full_pbn || required_slots > available_slots) {
> +		drm_dbg_dp(dp_display->drm_dev,
> +			   "mode:%s not supported. pbn %d vs %d slots %d vs %d\n",
> +			   mode->name, required_pbn, full_pbn,
> +			   required_slots, available_slots);
> +		return MODE_BAD;
> +	}

I almost missed this. Could you please point me, do other drivers
perform mode_valid() check based on the current slots available or not?
Could you please point me to the relevant code in other drivers? Because
it doesn't look correct to me. The mode on the screen remains valid no
matter if I plug or unplug other devices. The atomic_check() should fail
if we don't have enough resources (which includes slots).

> +
> +	return msm_dp_display_mode_valid(dp_display, &dp_display->connector->display_info, mode);
> +}
> +

-- 
With best wishes
Dmitry
