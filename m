Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB50EB069FB
	for <lists+freedreno@lfdr.de>; Wed, 16 Jul 2025 01:40:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9573B10E730;
	Tue, 15 Jul 2025 23:40:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ke/TAz21";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD70710E730
 for <freedreno@lists.freedesktop.org>; Tue, 15 Jul 2025 23:40:49 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDN73025972
 for <freedreno@lists.freedesktop.org>; Tue, 15 Jul 2025 23:40:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 U74p2NgokusBYICtX+RuOyJ/0ZE3xSV0oX91XuR8eNw=; b=ke/TAz21O+HjjcTw
 SlaGcYjyLsajIpFyU7Kq9fVWzI3pBXIM6yDYkXoxirJwGLy7GDuH8qe2gnv36SLj
 bYX/XvAqfgI+fFsaoZYzEZKMc/RWLn3Y3c8TywRYqs0gj/YU1o+i0dP/fwn7TmCT
 +ZTsAmrJXfPnC/r3o2GgR0c2TgEh8fY9r9A4pcrpE1K/SKhwLBC0UUYb4Ke8Rg9v
 EDLGheYUGiKpQr5+csF761XIFOPc8FKjuYp6QksIhTSRHy9kpdtjfXJ7Q0VBg9Uo
 8wn4Qv/GuhdrigYlzJDhJMsOisF0/lBB64aMTbhakpLFjeIq7gBCXdrNbWbwXjy2
 zf82xA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsy1nvv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 15 Jul 2025 23:40:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3122368d82bso8642857a91.0
 for <freedreno@lists.freedesktop.org>; Tue, 15 Jul 2025 16:40:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752622848; x=1753227648;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U74p2NgokusBYICtX+RuOyJ/0ZE3xSV0oX91XuR8eNw=;
 b=gxikWfsrbP674S7C4g2HC8ow3NMvJ+uWJY54ZqZ5wBDXDB2RUIsENahukTsERjI4Sw
 ezTaolL6TjXOb3zoXnWE13FnxSFeFHFxCK/9ubWVhzoDi051s4Un+DEGV4ItQrCrGJQ4
 MGdgrdXFw+21yPhEaZGAXMPGRYhHY/dwWi3BYrUJfVNrKaKWrwej6B96FVXSMTGhCxdr
 2x5+G96iboeq0ueHxOk4T9nbOgEhbYBccAKiaa7UuO2K4vuezikoXCXXwfHojPslLyAb
 /pJ2oBPiaMIQAcsMaCRtrecmn9t9kPNPeoiAU6fCh0ov2TNU7rtQbUzx43WWKLHnY4kr
 GGwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrmo/bxWWWOi0r8y2V/546LnUR4l92J5Obs7/Ux6d/y6K6KAreg8JI/+F7EIz3eRVSCaYo/VJB98Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1eXHKIu3PO/zxLfn9VagHcflfdaf/idTQRAaqeahxarbQPiHf
 4udpPEpGkTIBCSjrSA6tQRe5MOTeX7wAkpSn33XBWmzFbm5VEXjWSuRUOnaPud2Gq7/cCJunRF0
 h7Qg+J8xldtCAy8jJyAWcgM32eaVUmzJsnyyNrvexc1JtaU0nD66aTmULEWC0gOf7o4Hx3Hg=
X-Gm-Gg: ASbGnctj6C13tNi2GZlWPei6XUwLv0HuJhpfhFkwy0w7qqZrrva624frqxxHk+V07Hi
 HZh7ASj40I1OizlJKwIBOuT5wP8NQCxCfPfq6QZxHUkBWyqg9Ez872m74XNYHWNp2koNc+zUq9r
 rAWf/Qc6cXPAo339dkmJijOKpLxD9EXrRaCPTKLe5cWVZQU8fOwnlDNlBW6YAgk3if2J7wAqtkv
 +6j8cLm1/Cki/xBEiZtYoE0ARx2bOJoYbynyFRk3AtbP6gPYTkhP7HuGtviz0+HRhkgugNVsysL
 2MBOFQuR7asbEcHnLw6XHaDmynQ2x5isJb4eMFSPPMfFgNofBrqIXGy0ZRrxn4v0CXDFCdrNh0b
 dWdopv/oww2ByDLF/6ORhjA==
X-Received: by 2002:a17:90b:4f47:b0:2ff:6167:e92d with SMTP id
 98e67ed59e1d1-31c9f489b00mr504216a91.32.1752622848207; 
 Tue, 15 Jul 2025 16:40:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTTJbpQZuVeL9T10AqTmZygZig9Img276JHEdkFxvJJ/A1KoaAeYTrUG70jqOz6RxoHxwmBA==
X-Received: by 2002:a17:90b:4f47:b0:2ff:6167:e92d with SMTP id
 98e67ed59e1d1-31c9f489b00mr504193a91.32.1752622847720; 
 Tue, 15 Jul 2025 16:40:47 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3bbe6c5660sm12492300a12.48.2025.07.15.16.40.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 16:40:47 -0700 (PDT)
Message-ID: <5ff344a4-cbc5-45a6-9258-9d51c73c24e0@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 16:40:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: correct dpu_plane_virtual_atomic_check()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <20250715-msm-fix-virt-atomic-check-v1-1-9bab02c9f952@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250715-msm-fix-virt-atomic-check-v1-1-9bab02c9f952@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDIxOSBTYWx0ZWRfX58RQ4QR++NM7
 oBJnApGrxC3Mlq0RiTcgAWzBIVNLEQ9pIVY8K0hWx3NrZY1eks/WsK3Fh+9VUtLy8dHyC4KXxUq
 /sgXdvJHDswDWhioryzoAKbuJUf40c95lURBROd/5CcINtMgJWcGDfd4m5uyqaYqUQTZldhnXgf
 ITjGIaiN7CktxtuAd+vmTQxONKmhK6frLSy8I453X/mIMRGvEMeO8wKKTc+hiNNlzJLnUDRk89N
 eFRLdifWVjXHAsvSssq6r1OJsAED+ZECHamlxSC2QION4h+QrwPoSxk9wx/LCXhI2VqnZBPaZCT
 nd6FDsSYDCOcRTQG3hG6e2QSd7l+/lD6vu7Sj/ANt/NjPNBLiuXTwVQRNkYi3pnD6xgtAdHdzlV
 3jjokDCZXXtm5zStN0xPZJfE44BRd/lc2cTGT7TtDIzTOZGuGAgWTDcyM2WSwZiei4rsfxpV
X-Proofpoint-GUID: VxUzOgIdC6kJ_flwivZp4McoEkUPubfU
X-Proofpoint-ORIG-GUID: VxUzOgIdC6kJ_flwivZp4McoEkUPubfU
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=6876e701 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=kWyCMJcj1dDTDgwf64UA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_05,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=864 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150219
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



On 7/15/2025 10:28 AM, Dmitry Baryshkov wrote:
> Fix c&p error in dpu_plane_virtual_atomic_check(), compare CRTC width
> too, in addition to CRTC height.
> 
> Fixes: 8c62a31607f6 ("drm/msm/dpu: allow using two SSPP blocks for a single plane")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202507150432.U0cALR6W-lkp@intel.com/
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 01171c535a27c8983aab6450d6f7a4316ae9c4ee..c722f54e71b03b78f3de82fec4f2d291d95bbba3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1162,7 +1162,7 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
>   	if (!old_plane_state || !old_plane_state->fb ||
>   	    old_plane_state->src_w != plane_state->src_w ||
>   	    old_plane_state->src_h != plane_state->src_h ||
> -	    old_plane_state->src_w != plane_state->src_w ||
> +	    old_plane_state->crtc_w != plane_state->crtc_w ||
>   	    old_plane_state->crtc_h != plane_state->crtc_h ||
>   	    msm_framebuffer_format(old_plane_state->fb) !=
>   	    msm_framebuffer_format(plane_state->fb))
> 
> ---
> base-commit: 8290d37ad2b087bbcfe65fa5bcaf260e184b250a
> change-id: 20250715-msm-fix-virt-atomic-check-ae38fcfd9e08
> 
> Best regards,

