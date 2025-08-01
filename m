Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DADCB1832F
	for <lists+freedreno@lfdr.de>; Fri,  1 Aug 2025 16:06:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C5E10E869;
	Fri,  1 Aug 2025 14:06:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rh4XrDsc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EFCA10E869
 for <freedreno@lists.freedesktop.org>; Fri,  1 Aug 2025 14:06:12 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5718YpFK004997
 for <freedreno@lists.freedesktop.org>; Fri, 1 Aug 2025 14:06:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=X5mYO9TNcqG6LvwHvkvNnoW7
 mrgbAWbzpJxMDANF+yw=; b=Rh4XrDscXyf2Oo02oBHA4UuChG3U+1dh+T7OZAib
 VOuvM1m8SWmIm9s0HizjkP+In4P+XyxFB4XZx7IO7Jk/zzYjW/kIu9MAoHDfanDt
 ZK6ZqoVyXjZ4oZ9aQZ//45SiMCQnN1Md4SWDUjpVylMLrsI6fDTO6e1lMPCbcul0
 oj45dL+plcwt4ZOUYWeVSm6+aXgBwJX1E3S9fNMRuKw5jxIHAfkXX8Cu7W2h2xE2
 KUNOSM2i5MN6SzVqn+zzuAD2NNXnZ3nFwYlKDBiFE8zuStZ6F5rYuv5nXO0iq51Y
 M0bXcC1Vu0z1BSpGM0cpy9kLcSbf0lYPsu/KiiErHey7GA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q86cctu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 01 Aug 2025 14:06:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7641e7c233cso1977467b3a.1
 for <freedreno@lists.freedesktop.org>; Fri, 01 Aug 2025 07:06:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754057171; x=1754661971;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X5mYO9TNcqG6LvwHvkvNnoW7mrgbAWbzpJxMDANF+yw=;
 b=KbB9oQJqWkBoyUArVQ3yM2r4sXrQdtdpxSspwEEn6SiUoMQuvg80ZzwWLGzRXAVTFI
 x2fU3ttuU8N1VSnM4UB2kBZiQ1lHUCR0Qez9yoorkMU6ezh9PSx1FCX6MoxdkncCTwOa
 6bIwc4CcAOr8s1mPUZu4N5/vsiXJWP9oX2xCNyloIstdJd3zwWeYH6yZNdK+0oEUCnuT
 c/yBlcj94Oh5W3K8VZpC/chffs2IfVvslNDb9+fYP59KT3KSwJRQA2Z0Qq5KPZcJ/IV/
 +p8dbP2okDzWDxFd5vFiJsvlirR9fjzO1mgsXfVKMFpJS4FY7uZvKU2tQGZWJzkS/xv6
 tPrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeFZ0PI6pFiMvvSXsK7RywNQUgvc6+JYgp86pbkOWlaWyTxrC9SF8+89ZHAnPQ+gTNC0jIzq7VTcU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHQ8WQYO/8igQVmh7kAwkzy0NZ2XLt48ZF1viuF/6vx4swS1i1
 oVR3b7ppxGerS986DXDlhH6bZnQ8oYllVXzAxIA6rS0HAaEPAOHoYGISuC2csOsdUEoM1hU9peJ
 hkAXmLDpwtiypc8Zy0XWprOo9r2Mt8JlbYYdUAN/yKvtOirfYF3O4ARor0umQnhfHEbKqV+o=
X-Gm-Gg: ASbGnctb5T/tV/ehvoHTJrskmONoxICKR7iACGehnMtn2XGercFbnBtJc/9Q2OGQf8n
 sIcXldxgcMWEObB3rWRwiwLBDODZ/6X25G5zfEEHtCjdyVTFc2fAUWRCIKsu/olsqH3+Cx2O+M2
 O4D2vT88LhPUfyusYl4qDHaKUxFrma7Tw+mcUA46hhzcp7gA1BPw8lzOuhaW5mKu34NpwzWnWOM
 ln1wadLFaZmbs7Z/cZyO6Xhr5yCe5pfNNcRnilwxZ6oA6qM0DtbW5ck7ZHYJNj06kMFVo+fqdOe
 ZVrCMupCg92eH1Oc+awtpqSadH/5D9DHFD0OtiUnHhfrCWULBztIuSBtw1l9D+Rfh8TUL/szyuw
 tE3rxl3bx6DQs29bCNWdZTEA4TTBAJWhD22pgCsKl768/33icnltK
X-Received: by 2002:a05:6a21:33a5:b0:239:29ea:9c97 with SMTP id
 adf61e73a8af0-23dc0ec463emr20483662637.24.1754057170865; 
 Fri, 01 Aug 2025 07:06:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGitYNtTnXOBq8raaQNZX9YeStN7g/CeoibFIFiLag1gYHl4anqkXU57qCgbVhM4DI8a/qNMg==
X-Received: by 2002:a05:6a21:33a5:b0:239:29ea:9c97 with SMTP id
 adf61e73a8af0-23dc0ec463emr20483562637.24.1754057170060; 
 Fri, 01 Aug 2025 07:06:10 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-332388fc7d0sm5621721fa.59.2025.08.01.07.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 07:06:09 -0700 (PDT)
Date: Fri, 1 Aug 2025 17:06:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 5/8] drm/msm/dpu: use drmm_writeback_connector_init()
Message-ID: <z4ewbwtrqnem3af2tuket4wpgsulo6f6vy54hnhxrcx56hdx23@i5nuuiw3j36g>
References: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
 <20250801-wb-drop-encoder-v1-5-824646042f7d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801-wb-drop-encoder-v1-5-824646042f7d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEwNSBTYWx0ZWRfX2Don1cLDgvHs
 2F+UYP+MW+SLVse98plNN62MUezGxd6HsrB3vUiBXNNIw9tz67qWSBFMi+JSfpR2cHJNoMZQ/Vo
 I6Dt8XXzrCl2cfSAqVgiu+pCJ19/KiZvOkrSOZmzBmRkFxQ4Ar9UZPUJgBALZa0DYHMrqSGri7k
 PiC9kGMZO7LXS9ld0EbIFS0ZDxRVw3pyBgIbqIvxLkabTWAtrDlaSdW03xAIPwcuu+W+VgQlsEG
 TEY8NBK41djW+HsG+ZOHCLJrQMazeGTkhDuO/V/9Pydu6ciTd2142x5oI+m7Jq+BD/4ofSNKgG+
 lQvHyK5W+NEcY+qr7DkdYWLgR84UqW1oGYbi9i3ZxWDD6cjyFQr4AvM1bLjm7moF4aAhlUvYnuZ
 54pchfEk5lR9An4oARh6AqSQT2ZcaI+pdxa8CHVb9gxxwdFGps2wdB7FbwWt04VXCJEAUIx/
X-Authority-Analysis: v=2.4 cv=TqLmhCXh c=1 sm=1 tr=0 ts=688cc9d4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=noEQxEA5MoPOL7h678AA:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 8QD8dlCTMA2omvPL1tG4cBWUaoKkESzo
X-Proofpoint-GUID: 8QD8dlCTMA2omvPL1tG4cBWUaoKkESzo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010105
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

On Fri, Aug 01, 2025 at 04:51:13PM +0300, Dmitry Baryshkov wrote:
> Use drmm_plain_encoder_alloc() to allocate simple encoder and
> drmm_writeback_connector_init() in order to initialize writeback
> connector instance.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c    | 23 +++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
> index 8cd37d7b8ae281cbc1fd8cbb243c621174517e23..9986a10e8114680e9da48986f4ca3ce6ec66b8cb 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
> @@ -134,7 +134,6 @@ static void rcar_du_wb_conn_reset(struct drm_connector *connector)

And I used wrong subject prefix here... I will fix it for v2 after
getting feedback on the series.


-- 
With best wishes
Dmitry
