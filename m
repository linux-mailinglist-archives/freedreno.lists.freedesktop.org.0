Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD60B2B427
	for <lists+freedreno@lfdr.de>; Tue, 19 Aug 2025 00:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5452E10E1F0;
	Mon, 18 Aug 2025 22:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="N2j6AD8O";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 274AC10E10F
 for <freedreno@lists.freedesktop.org>; Mon, 18 Aug 2025 22:39:55 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57IFRw9M031360
 for <freedreno@lists.freedesktop.org>; Mon, 18 Aug 2025 22:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BY1hgucLdkNvv01XAwo6wMbgTIX6hQM/0OVtxlQdU3E=; b=N2j6AD8OZFna85lc
 5ERyzh/bddCRfREKd9K8KJlnazErW5hUvVlEWfUyyLTH7rp0pjbWOXZyH36leg/h
 HgHiY6yINFPTn9CKmzeVRR4bZoyrlqLamcp5qX0eCZt0pRdVf5c/Ns35PKzhD7we
 905oulXH+G9eiCLNlG72goh0tIDtatL+tjWfQvxSxe06m+PJh4s8vaEEnRSjG58u
 4yq6kM7MC4moR5eqwRgWFR3tmjAb3G4puOKwhzAR/i9/Ed5qpn04H8U5731YiY32
 TQrSdTQH/3kwZteoLoy2hEyNFM/U4KPhSO5zaPH6qsz0Dvi2OTK2ni54CAcO7xQG
 SAdWGA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhagxcse-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 18 Aug 2025 22:39:54 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b47475cf8edso2650766a12.3
 for <freedreno@lists.freedesktop.org>; Mon, 18 Aug 2025 15:39:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755556793; x=1756161593;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BY1hgucLdkNvv01XAwo6wMbgTIX6hQM/0OVtxlQdU3E=;
 b=OYul2OoF4tRyImR3GIy9cSrDsY2g6f1046MRyPoQasVltZhxNwrlgEZZwU44FlhSxU
 OX+8O3R6Oz+Y0DYYlSe2gX7LvX1y5iUPkvHRT7Mbhg6XwG6kiOVfS9Oo9EZGXHDMYawH
 C613f8jgh2n+Bj49nvgZscl7nT+n4FwqXG5e1v9xxq8w0MD+t/nqHWa8w0jk42n+OTh7
 WIGqJKlkH/qD8ti9FC9XMkEH/gFw68FjAwMgmkFbZTQEdGDKtMiWo6qFyJ/2r88Owgex
 ZbpdXQDV79x/zl7AIIXV5Xxf6bPJMxZhfZ5YQ4SSlwSmsZG68bBVV4dGTh6a+8lTpIN8
 Glyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6ANPUMqRK1awnh0qbj+4ag1XXG4D3Dc207HLJav5MbY8/z7Qg4sYBGhQtcMhTgD7GGqJow+p2uE8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLOr90js2v04CH0s7Zosi+pjCqutl5NbOHfnnG1NyF3NWRrgnf
 d9108VQkdnulDVUqSq8CSX8LnQc+ZSR46MDi2a9tQ5QaqP1Lxsh4oUI6WUHrSK/mpftUbY7XVNC
 codsPSbTvF28Un5dHWgRObWV9oeqLP+iyJBBWQGQbV4thAB9D4M3oO35oiR4NGgmMbwbCZPM=
X-Gm-Gg: ASbGncsjLy9JIvtXz64J39TcjKL8XoE/l91wOvT2g16OWgrwIt1YkTG6KqMtTMnt8xC
 aOMCoH8QrkzJvgK98FqoFp5xD3STc52YGCDkOI5gw+CTjG77XriUsKklDVXFZKjxbarTINybfdk
 oJXAEUlEn6vg6QwSsqEdMp6MIRKbgqB8lP+79PMqirOzXKDWVSDQDTDWWoyDB8NX60bq0Bnc0v/
 1gWZFtoGP/KXz6xEXMKrF59549GGG59DSn+ONJoed29lGid7wyViINR0xSBDhCR7OsLmm9BCr/n
 gDreJpB26lsJ9Mq8/XTkX5XoCmzdZT+e+GYequr9pgCgQ6C9LckoQ5G2oGEYHGDYiBx6dAPsh4m
 ItiJ5/e2jT1qmOm9q8XOTFQ==
X-Received: by 2002:a05:6a20:3d89:b0:235:2cd8:6cb6 with SMTP id
 adf61e73a8af0-2430d491e52mr384033637.34.1755556793503; 
 Mon, 18 Aug 2025 15:39:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHq6QzQ92Ms9MWn6tK7XtdYkvkgmvMQ1omaaWBGATwca5iSKcTllJphXcM5JkwhGnaMgdjCwA==
X-Received: by 2002:a05:6a20:3d89:b0:235:2cd8:6cb6 with SMTP id
 adf61e73a8af0-2430d491e52mr383994637.34.1755556793043; 
 Mon, 18 Aug 2025 15:39:53 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e81227473sm122042b3a.51.2025.08.18.15.39.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 15:39:52 -0700 (PDT)
Message-ID: <5572e441-750d-4f91-b08b-5e50f4f79ac4@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 15:39:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 08/13] drm/msm/dpu: split PIPES_PER_STAGE definition
 per plane and mixer
To: Jun Nie <jun.nie@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250801-v6-16-rc2-quad-pipe-upstream-v14-0-b626236f4c31@linaro.org>
 <20250801-v6-16-rc2-quad-pipe-upstream-v14-8-b626236f4c31@linaro.org>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250801-v6-16-rc2-quad-pipe-upstream-v14-8-b626236f4c31@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D9xHKuRj c=1 sm=1 tr=0 ts=68a3abba cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=lKL-FtN6G_pLEYU0NVEA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: m5MsgPDSqf5gFBKUe8Iu4MK1RPXDH4lf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyNCBTYWx0ZWRfX7cupJfr/fVFK
 hruNXRmlwgqvPQw3xoC8kyAauIBamjdZWDC+4NsMoaZIr2StQr5JLoUjYlZQ7gP0ws8Vwf6E4k/
 bq4+rWCVY6f4LxeDC2IORvECRvfCrKrkwCI8w/TYAC18zE6h9WGPA8yQxfLbHaeR9583NyqQWsM
 ZUi5WMVpVMkbwB5aTULr7UXstyGkUOyKbswkEeBRQ9/mZ1oOr67SD18zGsXqUsxY2j1GE/J3bTH
 YUZyKSrcNJlxMqjlORYc27ROciCfeYltmx3VO77dJf8W8p3oePR925Y2umwuX8fjLXhz9wsFdX8
 W0Icy1tlrfizfIlceLkcWIFFJc+9aIo8Zd8TVjo9wGggfzmrStsAawUH85/uCxpQswRQqihcjqz
 z0tOCw+F
X-Proofpoint-GUID: m5MsgPDSqf5gFBKUe8Iu4MK1RPXDH4lf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_06,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160024
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



On 8/1/2025 8:07 AM, Jun Nie wrote:
> The stage contains configuration for a mixer pair. Currently the plane
> supports just one stage and 2 pipes. Quad-pipe support will require
> handling 2 stages and 4 pipes at the same time. In preparation for that
> add a separate define, PIPES_PER_PLANE, to denote number of pipes that
> can be used by the plane.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  7 +++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 18 +++++++++---------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   |  4 ++--
>   4 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 121bd0d304b308bcd7226784eda14d7c7f5a46f4..30fbd7565b82c6b6b13dc3ec0f4c91328a8e94c9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -472,8 +472,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
>   			bg_alpha_enable = true;
>   
> -
> -		for (i = 0; i < PIPES_PER_STAGE; i++) {
> +		for (i = 0; i < PIPES_PER_PLANE; i++) {
>   			if (!pstate->pipe[i].sspp)
>   				continue;
>   			set_bit(pstate->pipe[i].sspp->idx, active_fetch);
> @@ -1305,7 +1304,7 @@ static int dpu_crtc_reassign_planes(struct drm_crtc *crtc, struct drm_crtc_state
>   	return ret;
>   }
>   
> -#define MAX_CHANNELS_PER_CRTC 2
> +#define MAX_CHANNELS_PER_CRTC PIPES_PER_PLANE
>   #define MAX_HDISPLAY_SPLIT 1080
>   
>   static struct msm_display_topology dpu_crtc_get_topology(
> @@ -1663,7 +1662,7 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
>   			state->crtc_x, state->crtc_y, state->crtc_w,
>   			state->crtc_h);
>   
> -		for (i = 0; i < PIPES_PER_STAGE; i++) {
> +		for (i = 0; i < PIPES_PER_PLANE; i++) {
>   			if (!pstate->pipe[i].sspp)
>   				continue;
>   			seq_printf(s, "\tsspp[%d]:%s\n",
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index 175639c8bfbb9bbd02ed35f1780bcbd869f08c36..9f75b497aa0c939296207d58dde32028d0a76a6d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -34,6 +34,7 @@
>   #define DPU_MAX_PLANES			4
>   #endif
>   
> +#define PIPES_PER_PLANE			2
>   #define PIPES_PER_STAGE			2
>   #ifndef DPU_MAX_DE_CURVES
>   #define DPU_MAX_DE_CURVES		3
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 5e8703b0e2abb89887a5661adb3542a0c10d2b32..55429f29a4b95594771d930efe42aaa4126f6f07 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -634,7 +634,7 @@ static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
>   		return;
>   
>   	/* update sspp */
> -	for (i = 0; i < PIPES_PER_STAGE; i++) {
> +	for (i = 0; i < PIPES_PER_PLANE; i++) {
>   		if (!pstate->pipe[i].sspp)
>   			continue;
>   		_dpu_plane_color_fill_pipe(pstate, &pstate->pipe[i],
> @@ -1158,7 +1158,7 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
>   		 * resources are freed by dpu_crtc_assign_plane_resources(),
>   		 * but clean them here.
>   		 */
> -		for (i = 0; i < PIPES_PER_STAGE; i++)
> +		for (i = 0; i < PIPES_PER_PLANE; i++)
>   			pstate->pipe[i].sspp = NULL;
>   
>   		return 0;
> @@ -1212,7 +1212,7 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>   	pipe_cfg = &pstate->pipe_cfg[0];
>   	r_pipe_cfg = &pstate->pipe_cfg[1];
>   
> -	for (i = 0; i < PIPES_PER_STAGE; i++)
> +	for (i = 0; i < PIPES_PER_PLANE; i++)
>   		pstate->pipe[i].sspp = NULL;
>   
>   	if (!plane_state->fb)
> @@ -1345,7 +1345,7 @@ void dpu_plane_flush(struct drm_plane *plane)
>   		/* force 100% alpha */
>   		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
>   	else {
> -		for (i = 0; i < PIPES_PER_STAGE; i++)
> +		for (i = 0; i < PIPES_PER_PLANE; i++)
>   			dpu_plane_flush_csc(pdpu, &pstate->pipe[i]);
>   	}
>   
> @@ -1468,7 +1468,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane,
>   			&fmt->pixel_format, MSM_FORMAT_IS_UBWC(fmt));
>   
>   	/* move the assignment here, to ease handling to another pairs later */
> -	for (i = 0; i < PIPES_PER_STAGE; i++) {
> +	for (i = 0; i < PIPES_PER_PLANE; i++) {
>   		if (!pstate->pipe[i].sspp)
>   			continue;
>   		dpu_plane_sspp_update_pipe(plane, &pstate->pipe[i],
> @@ -1482,7 +1482,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane,
>   
>   	pstate->plane_fetch_bw = 0;
>   	pstate->plane_clk = 0;
> -	for (i = 0; i < PIPES_PER_STAGE; i++) {
> +	for (i = 0; i < PIPES_PER_PLANE; i++) {
>   		if (!pstate->pipe[i].sspp)
>   			continue;
>   		pstate->plane_fetch_bw += _dpu_plane_calc_bw(pdpu->catalog, fmt,
> @@ -1501,7 +1501,7 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
>   	struct dpu_sw_pipe *pipe;
>   	int i;
>   
> -	for (i = 0; i < PIPES_PER_STAGE; i += 1) {
> +	for (i = 0; i < PIPES_PER_PLANE; i += 1) {
>   		pipe = &pstate->pipe[i];
>   		if (!pipe->sspp)
>   			continue;
> @@ -1623,7 +1623,7 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
>   
>   	drm_printf(p, "\tstage=%d\n", pstate->stage);
>   
> -	for (i = 0; i < PIPES_PER_STAGE; i++) {
> +	for (i = 0; i < PIPES_PER_PLANE; i++) {
>   		pipe = &pstate->pipe[i];
>   		if (!pipe->sspp)
>   			continue;
> @@ -1680,7 +1680,7 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
>   		return;
>   
>   	pm_runtime_get_sync(&dpu_kms->pdev->dev);
> -	for (i = 0; i < PIPES_PER_STAGE; i++) {
> +	for (i = 0; i < PIPES_PER_PLANE; i++) {
>   		if (!pstate->pipe[i].sspp)
>   			continue;
>   		_dpu_plane_set_qos_ctrl(plane, &pstate->pipe[i], enable);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> index 007f044499b99ac9c2e4b58e98e6add013a986de..1ef5a041b8acae270826f20ea9553cbfa35a9f82 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> @@ -31,8 +31,8 @@
>    */
>   struct dpu_plane_state {
>   	struct drm_plane_state base;
> -	struct dpu_sw_pipe pipe[PIPES_PER_STAGE];
> -	struct dpu_sw_pipe_cfg pipe_cfg[PIPES_PER_STAGE];
> +	struct dpu_sw_pipe pipe[PIPES_PER_PLANE];
> +	struct dpu_sw_pipe_cfg pipe_cfg[PIPES_PER_PLANE];
>   	enum dpu_stage stage;
>   	bool needs_qos_remap;
>   	bool pending;
> 

