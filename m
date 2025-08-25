Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CC6B34DE9
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 23:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D9C10E583;
	Mon, 25 Aug 2025 21:25:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nnqMBaHh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456FD10E580
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 21:25:16 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PGVtxp030384
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 21:25:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=QkdYyByc4qu2z3KivFhAjolM
 bNa7uS7Ln2Vatot7HuI=; b=nnqMBaHhCoIZuQmlmcrujNwKLGlo9GshRQFAxeNU
 4vylH8cKvMtUWWFI1ddEmpSMjNhpINqsN+TsNR8ucOVrKo43CbeGn54aUHeutiWI
 4xuMTNz649EhZ83SyTtXrFykuoVEu++gmwvUEHqpZFDItF9PTbze4yDk4q7PY1Qh
 qDa51+eGeeObAmirYJx2fqGDc6eIdY8yyhy02nhS81vpj4513NPF2jrXrqSOIgh6
 AhNAISH+3NI7ZzGdYWXGS1DQAseOC3f6oHhbaez/KJ/RTpx+6/kcgCDdgY38Pc6z
 oAz856XtwAsgxMKqkvl9mKU9CBxrGnnAV3r/Ft7jT5qmAg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5um6kw4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 21:25:15 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70d9a65c324so75414236d6.3
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756157114; x=1756761914;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QkdYyByc4qu2z3KivFhAjolMbNa7uS7Ln2Vatot7HuI=;
 b=KUKhSc2mudIlLF0Qw9BeEXZ7NWrL55YWo0rxX+PW2LUcKwsjv73d2rkTsBqx/64aVm
 GSlq0X1NF7kyIISI5cYuDAslIIGvZBitYmTkrCreYAsjPF5OZvWmoesidDJYJBHHa8gB
 d0bhzzjinOawzS3RbB0fykim1CZeLL9OzNc/HLy/mUd3742O03kfp7URyuY44TSyrH7o
 4Lhlk+/7xmQcYMlSiwq778vqfiTcEhPUkWDQKAII/8J3lwiat/YqQAG98+9nzWH06r5y
 /clnvSpwwEPHbjAhlX0qqGzbcqKn8Rsb7+ZIIBzZHeYdyKrM8AuAiX06GmgjNSKecDM9
 DJRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWTJtCeJ9+KQ8y4lSojym6NTdDi4IlP4xKfEC06Kc+8RZN5T1pIwBBDKc8/oNtywIap/aWXWSBflo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5k5eyuxB4ZXhHDfmtnuKqg+wBvdszLIzXXOIwoa4Btwpma8XQ
 bgjp+X38c7hdUnkwR3eNHSGIoUp/ORNRamXUYnPug32/uzkG6UUHPB3DbLIYCnk6P3jZz6itURd
 sxmvrErao6P3EqokFrieDgGnYVezOlkEo6Ww8KKKGkU3FFcCfLs5Oxkkc2mATCoNDutQcH/0=
X-Gm-Gg: ASbGnct28+EYLTkbYhksXK6jrQhX2/k7ZCrUTE67W1r4VRClUvAdAIw93ukXVk7mtBq
 FWz+odELp1gW0rFtvsg7jI4Xa5yrheuwqsn03e7KqPUSDg9kKAvAIqAFhBKG0Po+pvmblRK3Rdz
 wZe4Omq8eIfGksK7aZt/GtDUdSapBUFfz+roCRG0UiHg2j3zEyOi527w4+K70yzm6Ol6IrjPplq
 Iwe+i59e//WesADX4n3hnf1UD3mr6S9uw0gF97i3IthRFvLJD7mQBUCzZP5DVrpqP4zCX2oiCij
 ioG+51X1bLcFS5mqBI/coXZsiSpDUhe7wz9sKm9Ky/nWE08Js20ZZu3/FsrSMx0L+tWBSwmrQ33
 2vKObBjtlHxmsTf1CQKF+LJ3Y0bBA2AmSHYEFAVW/zTbk7SU6tAc8
X-Received: by 2002:a05:6214:5194:b0:70d:bdd2:7cbd with SMTP id
 6a1803df08f44-70dbdd285e5mr57898426d6.43.1756157114369; 
 Mon, 25 Aug 2025 14:25:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHq2rEu+6ixuxBMxYQ8u/Pd+yFWmby54+NU+NTEPnzzeO9/1ZQ/Y0I6iBmqPcH1qtql2z3huA==
X-Received: by 2002:a05:6214:5194:b0:70d:bdd2:7cbd with SMTP id
 6a1803df08f44-70dbdd285e5mr57898016d6.43.1756157113775; 
 Mon, 25 Aug 2025 14:25:13 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35ca730bsm1836015e87.148.2025.08.25.14.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 14:25:12 -0700 (PDT)
Date: Tue, 26 Aug 2025 00:25:10 +0300
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
Subject: Re: [PATCH v3 19/38] drm/msm/dp: no need to update tu calculation
 for mst
Message-ID: <c3e7aemrnvf57rupfegdetprztvrjyn3setvh7xorehm3wtxjn@mm5brbolt4zg>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-19-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-19-01faacfcdedd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68acd4bb cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=rNJhjsDl-Jf4-vzM-zAA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX7MGPafL+m1x2
 g2vl6U9lmsXdNNUumDqkmZY3KbLjr2++ZlzEem7xdjR1hgfEKuEYuQcf9UwKv5TzUfxmyinmltB
 dZqEepctyuM5Yn93LOnwsJ/CNdltniYzYH+ilrSOCp8y3UwdWUbmyAp8uToWsSccHiTmKeWu2W4
 Vu6EX0hnewaYqjxgGUts1dg3dr3DRI6EbLbxJfuNDxCv/wi2pgKWZx5w2VTtqQF8fzol6je8IwO
 TUY/dN1siqxrIi63T4rU+2xxaJvGn1hleCpOiFp1TXZu3TiPh3qQVvPO2vzUtqeIv+tc0PQf/of
 1hFgA8pCArSLKYA0uxpttM3+p/BwbMChA+5wduk8QMEvJ4hUTEThTYYG8nWQbUd7vyOslPjpZ2m
 kdJnwn8L
X-Proofpoint-GUID: sQnHcwOxIDQH9pev75QzPhSS0MwqC6G5
X-Proofpoint-ORIG-GUID: sQnHcwOxIDQH9pev75QzPhSS0MwqC6G5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_10,2025-08-20_03,2025-03-28_01
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

On Mon, Aug 25, 2025 at 10:16:05PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> DP stream is transmitted in transfer units only for SST
> case there is no need to calculate and program TU parameters

comma before 'there'.

> for MST case. Skip the TU programming for MST cases.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index d562377a8d2846099bf0f8757128978a162745c3..c313a3b4853a1571c43a9f3c9e981fbc22d51d55 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -2685,7 +2685,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>  
>  	msm_dp_panel_clear_dsc_dto(msm_dp_panel);
>  
> -	msm_dp_ctrl_setup_tr_unit(ctrl);
> +	if (!ctrl->mst_active)
> +		msm_dp_ctrl_setup_tr_unit(ctrl);
>  
>  	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
