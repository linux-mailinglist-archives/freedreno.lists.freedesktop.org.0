Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BB1B93A2B
	for <lists+freedreno@lfdr.de>; Tue, 23 Sep 2025 01:50:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D4410E03A;
	Mon, 22 Sep 2025 23:50:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RsOPHmQd";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1409010E03A
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 23:50:30 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MHAAEM002083
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 23:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=akMAt+oUQPKktf6eCkzkJKDk
 y5jxsD9+xpwyL5NmVEo=; b=RsOPHmQdKbQ3dBaKvEywzLEP+FiPkKnG3iD4rNA4
 OIWMW57/5T42PZ7wMGPXSNSjQ4GRdI9T2kZeIbOas3NxKhb6RhAieuW3NKJKRrs0
 qFa7w0HOMc1f6g6DY8+HKvOVXMxyBYvuhKPhQEzOL5Wrb9Qi1Hb7+JQGpBZpnSO/
 kAri0Q2HXXQkg6F3TRzjQBpFSftZMF4VrnfoXpPdn+w7BRF8ielQCAErj2ZkgPx4
 l088QfuGTuEDub7g1i2pVXsYZp/apHuxYuzWl/9VHYu/09B1HI+X98xOBoUQX4C4
 MmM/JJAZrwTSD9sRYpB22vgcFoXHjlErEtsntgYh77u4Tw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1feetp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 23:50:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-726a649957dso96416476d6.1
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 16:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758585028; x=1759189828;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=akMAt+oUQPKktf6eCkzkJKDky5jxsD9+xpwyL5NmVEo=;
 b=XAk/E7/b2czfqimPnT36xfVp3214NpVeXdoImlZHfHphCGO8aCOD920uR8lQfQGlo9
 KO9vjOEaGfAOTGtFonpZMbNn6vbZ1Y1RAXpCCUKBsv4FWyuKukF3CrdxJkw3Qd4ptRRi
 zZylHC9WGM2mvxEo9rH76Y2gLnm3z19KVmlpoba0pMTLr42yvRIYzHtSUYWiRsmHs2JV
 JN8SV7V2BSgufvSfywq3o++dfzRCGt9urvxRtS6/l6fQByQ5uJYRbjBMNn62zHMXyrEt
 2mBeR0iAwIRABKB/GVm7P2WRSlsSGzQjyJ9NZ9Jki63Pm5HuttRZbVHOKKSPx3vI08No
 M7BQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU27Tk1ApE4lbM+aJG1ag2MsUboy9RGU4J1yzaD/IMdvtuHic2jgGUG2Eztc4/SJMrxfAqizOSsvpM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzi314RaeCz3VFmCs2f8lvbO1iFdug7Vlpk+YYGyKamMvwLGqVm
 UC978Q8O4tD/N1vHG1ornzyLpLWfe+gal9pOSASiTOtRAHdsi6qI1Tu4vFb4T2K41SrcBPf1zOT
 +lr/UAqsnUTYg71yT6WSpEiwa3l8aBOiL34n+PxqP08RfCKMouTJLienH00YwOMfRPVto2ew=
X-Gm-Gg: ASbGncvr4YTnufdH3ML8mdYC4i8zEhktYudL6RIQVHes6L7vIU/a+t1HNdx684onsqI
 E5mBiRKW/hoUSorht57CEURn30bRi/ophg90ARwni43j/Ao8mwyNvpL8hZswZnIieS1RDEznXU8
 kPMiwARCfrxeWMgLnZWnaifNZvCH97s8cPDJjyNcd1LlmHa6mxt2ezRg3etlNXHWQMmAxlBpnMK
 wZmn5xBOLdsdNPzoHPW0ZZZuDVmE4bWURBGdo4XYmJC/mr80/icsk/gu++wQIYugHvBuZBfF/ef
 Vm/poU/k4DQTagVy3I19TjHutXryPnvZO2WZ8Q1YseB8XJBibGroZJngB/oUnlZGqXwLeluzEci
 wD72ysVRPe1r9a9cOeyTiMHPi9jtTPSL3GFAbBigi+pOvqV6unj9q
X-Received: by 2002:a05:6214:1c0c:b0:782:1086:f659 with SMTP id
 6a1803df08f44-7e707846c97mr7811376d6.26.1758585028071; 
 Mon, 22 Sep 2025 16:50:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8SQsuqffPmbCFgiG+W9BrKws9UQB4tVnyo8wnkCaikEbrcZDprsLMa2pYefWv8Aef414ssQ==
X-Received: by 2002:a05:6214:1c0c:b0:782:1086:f659 with SMTP id
 6a1803df08f44-7e707846c97mr7811116d6.26.1758585027602; 
 Mon, 22 Sep 2025 16:50:27 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-57b5da082b0sm2121692e87.54.2025.09.22.16.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 16:50:26 -0700 (PDT)
Date: Tue, 23 Sep 2025 02:50:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH] drm/msm/dpu: Don't adjust mode clock if 3d merge is
 supported
Message-ID: <cjoxzwkvzjv7pqelcxcepafanauxjt7p5b3qevjdr5bsomifce@i67l2hzavctj>
References: <20250922-modeclk-fix-v1-1-a9b8faec74f8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922-modeclk-fix-v1-1-a9b8faec74f8@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: gepRarpjognzoHLjkyktiUXCabvJ03Pu
X-Proofpoint-GUID: gepRarpjognzoHLjkyktiUXCabvJ03Pu
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d1e0c5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Gz_hOIZ2IhTx4crym2oA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfXxJphyNJrXqg+
 k7gaVcViv9roeHdeenIS0FRjV1uQAh4webSXoLHCtW9hzyJR4U7/loUqpj2jHmW9tSsXSPVI6/N
 21NdPDsuswxdDESPOUTM/5hcHhhDGaXxa7cC3iqRFXaar7WS/LcT00zIepbQZKziK4qGKfMmdbc
 u8j7YWovCPmKL7gDCkoCZvqzteOybgVAC21WjK1cSKZu52rCVDb+57sPbZcfpcs2jiPrz08fGKQ
 6Gdvg6lSUjplFrVNnZ7DzOTq2qOaQGQ3v9+PJ0o14DMwVL1pV7Bb44I1dHGgXz07Aq93Ti7h9qi
 K41E8enaJuRVx2F1drUiBmYbFp7sqkfFNiweg0wzqXk3PTZdMgna7crln3ZzYSUfEdmVAD8GtuB
 YIo/71i8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_05,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037
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

On Mon, Sep 22, 2025 at 04:32:39PM -0700, Jessica Zhang wrote:
> Since 3D merge allows for higher mode clocks to be supported across
> multiple layer mixers, filter modes based on adjusted mode clocks
> only if 3D merge isn't supported.
> 
> Reported-by: Abel Vesa <abel.vesa@linaro.org>
> Fixes: 62b7d6835288 ("drm/msm/dpu: Filter modes based on adjusted mode clock")
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 4b970a59deaf..5ac51863a189 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1549,7 +1549,8 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
>  	 * The given mode, adjusted for the perf clock factor, should not exceed
>  	 * the max core clock rate
>  	 */
> -	if (dpu_kms->perf.max_core_clk_rate < adjusted_mode_clk * 1000)
> +	if (!dpu_kms->catalog->caps->has_3d_merge &&

Well, not quite. If 3D merge is available, we should allow 2x of the
clock, instead of skipping the check completely. I don't think that we
should allow 8k or 16k just because the platform has 3D Mux.

> +	    dpu_kms->perf.max_core_clk_rate < adjusted_mode_clk * 1000)
>  		return MODE_CLOCK_HIGH;
>  
>  	/*
> 
> ---
> base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63
> change-id: 20250922-modeclk-fix-a870375d9960
> 
> Best regards,
> --  
> Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
