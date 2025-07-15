Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2A0B069F2
	for <lists+freedreno@lfdr.de>; Wed, 16 Jul 2025 01:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 157DD10E730;
	Tue, 15 Jul 2025 23:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IaYCSLOO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B8E10E730
 for <freedreno@lists.freedesktop.org>; Tue, 15 Jul 2025 23:39:59 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDH2e003411
 for <freedreno@lists.freedesktop.org>; Tue, 15 Jul 2025 23:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RJPlRCoQzcnkdT0dHLtH3H9tpyaccIIMXOn4F1lvVCg=; b=IaYCSLOOLEaD7LrN
 c+4qWtRQIwr9PbsPWTZao3TgCymOOJOmZECQEhAnPDrIM6rlecqc/gzA17hAKjgG
 VnhgYvgvLRa2DAyMv+gUj9QQYFILDfXiW0q473s1UBcR5ZBMr21PyVcIC2rIwF2I
 KxhYX+8Rwkw+YSCi65/ugOgmCrDQgtCjd2k7eYoGmr95nqmJy1CocCi99FtNEwcN
 tCEaPdzpnNh/A4frAfIW7sxs3lu/eXagbkYSXErqXrjFbUHH2N/1fZKxpjpPMeMA
 A/2Gduk5qR2x0fRKHt4IMfd83iPC1GzodJsnGj1EF+85DhqkHvzacrNWyUGxfZNz
 Y/Ug2Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5drmtfv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 15 Jul 2025 23:39:59 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b391a561225so4722820a12.1
 for <freedreno@lists.freedesktop.org>; Tue, 15 Jul 2025 16:39:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752622798; x=1753227598;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RJPlRCoQzcnkdT0dHLtH3H9tpyaccIIMXOn4F1lvVCg=;
 b=Xz4v4Sh7daELbnG9C0f5vgemkzxt8OYu1AyqeqlEbVIfkJmejymwfN+jOqRWr9ypl9
 ULFKMxo+wYQTLn/j8i///6qmgof4596pTwcKdpGFda1W7QZ7gEvQCr5hZnYk8bHRoofJ
 3ab/NsIJVjVANs/QFwOWJijtz2BzTBfexlOflJFhVqvzQ1IVqDGIWl/DP6enGUX+3abM
 CQ0shihER92ThPDIZzRBOrgX5mD0gOqT7YALVINFgtkr6rx+CvtE6/sNDj4LlYdH3sVh
 w6VJO3zfged5Dka7u+QSW+W1BeIknaN/rkno48njxgF4HDJm02GMLpeIYpcZHits8cQ5
 KTiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/QT0g6RVw/FXVYWp8wlciXJUzoycH2ZK3UZluMF+ED/SfUouJGIamnX7bLo0o9CgQ2IhHyLdosqk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4IhydU0+brZ1tNIqJkOMz/LYRTpQ1e6LwV5djF7TEbvahqoo/
 9cGDmS85LF38y1YOTb1IHqYtpZHS98IBedo2RW7Tou2Kf15L5oKT0ILnjMYL34kyNQyFcEzoSuF
 hub2meE4L3/wvrIUFrZeJvXX3o10FrL8VawEXpSwbuXKpxKoIQidZzbH24jhGdjD6QsEY3HY=
X-Gm-Gg: ASbGnctU0eoE1WFz0mZZQqMGoPpMXEXL/5K4U8gyczdCca08/jmkq8DkauUWiBjTR2S
 V4nkaF+FGS3xqe02s9PvwREwe/JxCJk3MHGT9yDGVIqkavzQ3UeQ8p+Alzvs3ZBf9CShYQBWKeY
 UANFEg0I5wDBoaPaZK7s2AoeqtI60nC++D2acRmQNAhpqs6lRpUEMPH61CQk/NLjOD7hgngHK6I
 H1ZKui/ARGtYVUC0LBIz+7GdQY3u90JgUt7VRKYjYLQT+T0JdWWj6SnNgOeStE1D+QN0NGZW9B9
 JWFEZde27y3nZheiqD2VhV930RQKg28b+AweaiLutHbDAJ9pePvqXIR4msWB6RAma/+P0MmqWTg
 si9wiymYtkQP2+dKgogqCYw==
X-Received: by 2002:a17:903:8cc:b0:23e:1a6e:171e with SMTP id
 d9443c01a7336-23e25789d06mr7514905ad.51.1752622798179; 
 Tue, 15 Jul 2025 16:39:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFf12jj/HXthN2xljhqv21Hmol41Hu+5CcS5uDGOfODnO8leUZVdIm61q3dSm6XrZYdYl3Kww==
X-Received: by 2002:a17:903:8cc:b0:23e:1a6e:171e with SMTP id
 d9443c01a7336-23e25789d06mr7514655ad.51.1752622797749; 
 Tue, 15 Jul 2025 16:39:57 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de4333e6csm118928995ad.162.2025.07.15.16.39.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 16:39:57 -0700 (PDT)
Message-ID: <03f4b74e-9231-43f7-aac1-b2ec1b6cf8ed@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 16:39:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: Initialize crtc_state to NULL in
 dpu_plane_virtual_atomic_check()
To: Nathan Chancellor <nathan@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, llvm@lists.linux.dev,
 patches@lists.linux.dev, stable@vger.kernel.org
References: <20250715-drm-msm-fix-const-uninit-warning-v1-1-d6a366fd9a32@kernel.org>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250715-drm-msm-fix-const-uninit-warning-v1-1-d6a366fd9a32@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UBMsxVeKM0f7agE7dsq1IDEWZxGTWO6b
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=6876e6cf cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5QVS9psdCSE4z-izM1AA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: UBMsxVeKM0f7agE7dsq1IDEWZxGTWO6b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDIxOSBTYWx0ZWRfXxONnptxa77F+
 Ldi9c7OiWfqKzMSCP0JfVdWIrKfegKMTBJV/yCDQbL9V8BFGlzWLaD954/XFgGkxLlA7pgueP2S
 hcbg4DVucds0ZhAH/2lc9rYJr37tXnn5GjQSHrBCZiU6HQaXGA9R5Z3nAQQ42rAE3qZ6mHTa8f/
 lcaYlvsACAlHmSb8H5zJsRfEQIbM9XFfhBB8yEkYa3htvDM1oKaEnI+JhknzBIdeQeiT+ziMwN4
 qISZG32XBdZMmS1ho7KqYMGDOiNPUx7B4pw6ACc+ToqRq7aE8nFfIO4hfaUVOyLNZl1aMrvbAn2
 6V7h2zTXI0hdSe4zo+GYNImfQdVd/OUSvXn+GpzwSUiv1WsvudDy8932D8J6grsEMXORQMDAJ2D
 f5i1rr4ugovBtOmL6Iyt72rfw5zMX2fwT4EmrMAYNS1m3x70SMrMFF3/GoIS33Z01aStLe1V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_05,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150219
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



On 7/15/2025 4:27 PM, Nathan Chancellor wrote:
> After a recent change in clang to expose uninitialized warnings from
> const variables and pointers [1], there is a warning around crtc_state
> in dpu_plane_virtual_atomic_check():
> 
>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1145:6: error: variable 'crtc_state' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>     1145 |         if (plane_state->crtc)
>          |             ^~~~~~~~~~~~~~~~~
>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1149:58: note: uninitialized use occurs here
>     1149 |         ret = dpu_plane_atomic_check_nosspp(plane, plane_state, crtc_state);
>          |                                                                 ^~~~~~~~~~
>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1145:2: note: remove the 'if' if its condition is always true
>     1145 |         if (plane_state->crtc)
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>     1146 |                 crtc_state = drm_atomic_get_new_crtc_state(state,
>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1139:35: note: initialize the variable 'crtc_state' to silence this warning
>     1139 |         struct drm_crtc_state *crtc_state;
>          |                                          ^
>          |                                           = NULL
> 
> Initialize crtc_state to NULL like other places in the driver do, so
> that it is consistently initialized.
> 
> Cc: stable@vger.kernel.org
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2106
> Fixes: 774bcfb73176 ("drm/msm/dpu: add support for virtual planes")
> Link: https://github.com/llvm/llvm-project/commit/2464313eef01c5b1edf0eccf57a32cdee01472c7 [1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 421138bc3cb7..30ff21c01a36 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1136,7 +1136,7 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
>   	struct drm_plane_state *old_plane_state =
>   		drm_atomic_get_old_plane_state(state, plane);
>   	struct dpu_plane_state *pstate = to_dpu_plane_state(plane_state);
> -	struct drm_crtc_state *crtc_state;
> +	struct drm_crtc_state *crtc_state = NULL;
>   	int ret;
>   
>   	if (IS_ERR(plane_state))
> 
> ---
> base-commit: d3deabe4c619875714b9a844b1a3d9752dbae1dd
> change-id: 20250715-drm-msm-fix-const-uninit-warning-2b93cef9f1c6
> 
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
> 

