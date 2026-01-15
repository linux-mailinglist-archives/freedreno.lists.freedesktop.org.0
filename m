Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B316BD289C6
	for <lists+freedreno@lfdr.de>; Thu, 15 Jan 2026 22:05:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C45F10E7C4;
	Thu, 15 Jan 2026 21:05:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wuj8sJK4";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RofcvL77";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C5910E7C1
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 21:05:56 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FFYIiB2866464
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 21:05:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 W/kb6DjN+Kxg+2Dboyf3yHThguSDY0BOoE5Ljzy/mnE=; b=Wuj8sJK48O3yrePt
 UizqukN82n6mdH/IZFQyUDeSlTPjryOGTNCpcydP2U7RRtlknfaQUs3klMxVcxnF
 s8h2+fPitCpRCDic4qpydnK2191dpXZmJTD8qKFD8a0tNu+cS7MSgS7OXtOrRTNp
 JeSkD7k/92klvWffhLvml1WY/SmC1ARqKyiocECPB7jGTpT2hfVePnne2QjJ0aVT
 irAHhfaM0LuWbux18LJ/8y+qVp3ThCQmuL1fIzo0JsXmdByu3RxN7BYK4oz+crnh
 PUpKLiSGXHCN9YahEkwIJCDNYNmHd9MYjG5PizOPYP1KpCgvOENxjjVx795DBJwY
 4lO7NQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bptu2jfgh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 21:05:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c530da0691so299898885a.3
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 13:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768511155; x=1769115955;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W/kb6DjN+Kxg+2Dboyf3yHThguSDY0BOoE5Ljzy/mnE=;
 b=RofcvL778zBYlz62RJwRZrSX+2cDLUEq2n4L2CgTBkyvfn13WAYqqyZtgzvdWl59B4
 UoqlSMKe2uUmOcVhLOvu03Jgw/JJO95tYMif5m7744cDZouz33LnBJmlfmxM640Ozvb/
 bPNIL5gR7O2ndkIlnrH24VXOWYHhS3Q+qsdQ9of7kazYsPhD5zOM/YMmrvGmv//ivneg
 CO/g/KyJmgnK/dZnSJnFvegSFbz/PoQdLJzGEb2go1egspyEJlMAcK5p1vA4it61OfxS
 otFUbf08rWF6moUQVqT8AXIgM6YCSFjYAHUdoPeu2bFm78C9Hhs/7TlmCvbQ8VzsufCD
 BY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768511155; x=1769115955;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=W/kb6DjN+Kxg+2Dboyf3yHThguSDY0BOoE5Ljzy/mnE=;
 b=BDcHXKaUNGnr3MxmkR8iq06GZ/h3yAdp219F2y5arTr9H7Z44fpj/FPgtBwyWgzGXT
 OPus9a7SERR0RsCeupmi8QFcAqQPIo03zhE1Lp6CVSOMDIjwCFfaJDxzGd1v9xxgTBat
 5Zfj0xA4bMUQ21MPDKmYnE5FUiDLQypP60rSDs+1x1o6rdpGEAwsMBcnyRoTg/D5w2DL
 aTE2e5otVFS5Zi68gDuwJjrL09SFNLPEyaJvmbOQIhO97dRTssplz0dRLw/eHyYe1E0m
 /znnRoTlasx8Bi6aepehQXMWOe0C3Gu2i1KtXXp1Z+S2MdSIRNHVEUTxJmD2HFHJMF6F
 zIqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEAiOLTgu10+BApFwmxmCNFAEGm0M/44VYjKzhvjz3IgWFyUtyuWe5ljP/WSGJe7re3JO++ivQG6Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywx+7MyEPdTJGVWCYOcERHMcGjEtVw/a32BiTRaUAd+Ppyz2aKM
 lI6cdjQMUFy3f+AXfRuUPwCnZNowWlRnGyiO6eFsuvkOGP/E2mAAFo9bGLP+qiU+1QdhHacIUjo
 ktwJJRK6fvsTthWrxgOT9jwzrKBwUR/O4uMktOHVFnaw8pENKAaEreiHqQ3ZDfx0uW9Uq0KI=
X-Gm-Gg: AY/fxX7s0L77foLSdlQjOWVlwM8kgEypf7TBWfFsFV4AHYz/MDCyKlG1J24/I+qML8D
 h0detpiAYOMarqVxca5rIedcjtZyaQ3esKKoc3gWQizkyQG5Os/v/U3XYiTvPza1yNjcbuXb3Tr
 yWJqd6A0L/EhCEUpRz6q3iho5uhE9vfkdLBttGTcdNZ4Q9d//WXd1fC1VJDfHZl3GOkoYlI2e4Z
 IivPapMMNAfxeqI4jEe2s7IZJsq1e9zcHnDf6oSzVw/gcdWSEroRubTa2H1UzGBEHqWEeP7ixsO
 a0hEACEPhZqIsy4ul+BKeaaKqQSDQWgrPcQp06fM5nKXcqGwu2Ws5s3N6IU96Xo2dLXKA47JrJj
 Or0xg5cYSGxQhu9jITmnBxZvgAUHgaPQ478PA/Cxr7YgNV7yEsVHhYJ9xft+BO8LZ8LwJOzVMez
 n5+1vJLrg5MY+bYjhZH+xzyDo=
X-Received: by 2002:a05:620a:4141:b0:8b2:e1fa:6eab with SMTP id
 af79cd13be357-8c6a6948174mr99298385a.62.1768511154710; 
 Thu, 15 Jan 2026 13:05:54 -0800 (PST)
X-Received: by 2002:a05:620a:4141:b0:8b2:e1fa:6eab with SMTP id
 af79cd13be357-8c6a6948174mr99293685a.62.1768511154209; 
 Thu, 15 Jan 2026 13:05:54 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf397672sm155740e87.61.2026.01.15.13.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 13:05:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v3 00/12] drm/msm/dpu: rework format handling code
Date: Thu, 15 Jan 2026 23:05:51 +0200
Message-ID: <176851027323.3933285.2288254082530063722.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251114-dpu-formats-v3-0-cae312379d49@oss.qualcomm.com>
References: <20251114-dpu-formats-v3-0-cae312379d49@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2NSBTYWx0ZWRfX8BQvj978FHoZ
 gIbYdw/qWPFjwecMy3giq/ekVliBrKHfgLZAHxu5RcDnc0pt7ZXOJYz6hivTEBV2pX+sIDJ45xB
 b8O2z7MNrx5AVreRuIk7+xi6RbmJr3SrMyWEi7Ei5g8h2pw1h9WTs77jJ8g7ZX86tP4iHK0p0QP
 TXmMijhCseFQ1zwznGruHU6kqS1+KdXar7LZVhvA+2ZvyrZbWU7stH6NES33WtOlfqlWPX/c300
 eLvrNxOTjzW67ZItj85XJbEDrL8I5b+VJD2k0X4Bn6+P4tKv4nTVs+V5xAgxzNgv11AeWI+nxTh
 lW3UxJZpLiENjdNTsd+Ep6sWGzsLZu3N+ztLYreviig5eVSrsgHMIkxaVsymDpGkYhHLd/DKL61
 u9H4Qr+p6Ke5GK8pZVLR2Q7HeCZgIYvm707raGA0MJzoQJYCuBI9l6tL+hxFvGQHD8vBMQVt+qI
 Dxv4cp2MSQvKmJ3DNTg==
X-Proofpoint-ORIG-GUID: OCd_Uhu10suKj6pqiaxKq6pslv9GazJH
X-Authority-Analysis: v=2.4 cv=W6Y1lBWk c=1 sm=1 tr=0 ts=696956b3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=uKya-R1R7wZuNpulkw4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: OCd_Uhu10suKj6pqiaxKq6pslv9GazJH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150165
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

On Fri, 14 Nov 2025 05:43:27 +0200, Dmitry Baryshkov wrote:
> - Rework mdp_format.c in order to make format table manageable
> - Rework layout population for UBWC formats in DPU driver
> 
> 

Applied to msm-next, thanks!

[01/12] drm/msm/disp: set num_planes to 1 for interleaved YUV formats
        https://gitlab.freedesktop.org/lumag/msm/-/commit/6421e1c5075b
[02/12] drm/msm/disp: set num_planes and fetch_mode in INTERLEAVED_RGB_FMT
        https://gitlab.freedesktop.org/lumag/msm/-/commit/4066b57678b0
[03/12] drm/msm/disp: set num_planes, fetch_mode and tile_height in INTERLEAVED_RGB_FMT_TILED
        https://gitlab.freedesktop.org/lumag/msm/-/commit/adcd6dfea82e
[04/12] drm/msm/disp: simplify RGB{,A,X} formats definitions
        https://gitlab.freedesktop.org/lumag/msm/-/commit/8549e95a4b54
[05/12] drm/msm/disp: simplify tiled RGB{,A,X} formats definitions
        https://gitlab.freedesktop.org/lumag/msm/-/commit/2bd6ae0edf76
[06/12] drm/msm/disp: pull in common YUV format parameters
        https://gitlab.freedesktop.org/lumag/msm/-/commit/72ca4e9d0410
[07/12] drm/msm/disp: pull in common tiled YUV format parameters
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a4378e4bb138
[08/12] drm/msm/disp: drop PSEUDO_YUV_FMT_LOOSE_TILED
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3705de1965df
[09/12] drm/msm/dpu: simplify _dpu_format_populate_plane_sizes_*
        https://gitlab.freedesktop.org/lumag/msm/-/commit/72f20360d4cc
[10/12] drm/msm/dpu: drop redundant num_planes assignment in _dpu_format_populate_plane_sizes*()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/d4db3a06c5ba
[11/12] drm/msm/dpu: rewrite _dpu_format_populate_plane_sizes_ubwc()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ada4a19ed21c
[12/12] drm/msm/dpu: use standard functions in _dpu_format_populate_plane_sizes_ubwc()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/2f3ff6ab8f5c

Best regards,
-- 
With best wishes
Dmitry


