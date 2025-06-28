Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BD8AEC3FD
	for <lists+freedreno@lfdr.de>; Sat, 28 Jun 2025 03:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F5510E058;
	Sat, 28 Jun 2025 01:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GScHrxCq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83D210E058
 for <freedreno@lists.freedesktop.org>; Sat, 28 Jun 2025 01:58:49 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S0DRpe024279
 for <freedreno@lists.freedesktop.org>; Sat, 28 Jun 2025 01:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=eILDFaNaizkjDCv06c5JedL2
 Rc8EWoy8Yse02GiZCR4=; b=GScHrxCqgi9tyxBX6Eo06duCyR9cRm9KEoKX4rqs
 ATXdTfow8eA/ycegO2ld6PxL1Pqw33JVI2dAq/OI8GKRIWIUHrEeIghZmHKSn5qN
 qn/fgLcSw4EIux1UsJ7nw+cGz3X42wN8tOkMunrfDl7iXTmNgXRdb1uhKfJxVtkQ
 u9TutO5Qj+mMYJKrZqzrcli/wecZETmhounHe10uNZhPKT8DJ8G2d5szjm7miMVZ
 QXH01B2l1YL2WECZ3rrmgmY5r465MH8k6c75xcDO0AKiws15Dc53Hnl2nbYsriac
 Eb8AmGwlQSp+23XM4PYk+q3lw/Q9AUDk27BiOrqPhDqzWw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa51pmq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 28 Jun 2025 01:58:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7d3f0958112so402176085a.0
 for <freedreno@lists.freedesktop.org>; Fri, 27 Jun 2025 18:58:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751075926; x=1751680726;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eILDFaNaizkjDCv06c5JedL2Rc8EWoy8Yse02GiZCR4=;
 b=jM1YhZ/OCdX/FNsLd0B2asHD1ZUDkdj2mo+lLBXVVxVwoUyt+0guk5DjJuKlcBpWd/
 CsVDoYx2wJfrLGcGFl0kLDrXxog1DjU/1Ni1vXwe4BpE++JN+9z9aY1EDzdwuqbqZ4sY
 CfvRJXqhkUwdbFqK9UXUfNqE9hk8Lf7mqwBcS3UUJ6yZBJH1iYgKGOHrSwxPhANv+fQF
 qlrOlgDVYem/+aLRnhjDC8BZNEhUD0PBbReSYJzrf47PuYr2NiTJNo07iLCSeSXIdgry
 KuJbpYZF0KbknpTE/dqVS+jbSuohcE+B3g7aDXZKkjfyP38C4aO+zq+AOn2Nn0oAmfdG
 Yhmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGf73z3tdaRA/UL9cYOrOJaeWctfL1gM6ocoqA1WjiRUeFIIF+g4gXIU9g0jaVU0L+UX628aaaYKM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxb9ve2z0wtwHfY96DHC2Va8aB7EM+dZ7+r2OuadoTHNzmispQl
 CMtfUvZlkk7sSQKsRRxqTaYA7C9/8UE9BqiVTiJMz3Zg+1UufS7toNjK11Gh6p89jHduIZQdzFK
 7kvQo69s89SAc/OU1ODQA3KUmu3mMaST023Y9Clnj7SUcRNLaP21+I4gxha/QxIcTzMjb6Jg=
X-Gm-Gg: ASbGnctBDCxL3dJhVK08quIMP78MKh/sX48adIr2mC+vaO2kB+b7l34YgTxdiiEW+lf
 GZYTyaiaWfR3t9I0hjrBgsiX6Irz10J6rl6XTs/NQ3CGmVVHzqeQaiAnxsG15BWPx1M8XGdGH2R
 9z73vz67Ipp7bHVM5hA691cWFH0xjAM5qPd+aUYgGAoc7wQjEdW5QyJYYDYWMn8b8d7UFu9Z/KO
 xXg8GGUnxafVwcdBj7lHiTHZqg54BtVeFrXfMtCpIiP3DxUHr++KUCjsw5PbRRMLKSBC712+yzP
 m1Zz5H/wc3JX7Dq5S8TABGxS5uZ/IRU4MDoKOL/j+/g9uKvJIKz8fMW8yw48S71EwsNIGhw7CBy
 3p54zjsVmE4SLm5NeI2o0dFR3V+feM0B5M0s=
X-Received: by 2002:a05:620a:2588:b0:7d3:c5f1:7807 with SMTP id
 af79cd13be357-7d443909ecemr804971485a.1.1751075926232; 
 Fri, 27 Jun 2025 18:58:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGe6lwj3S9nIkZY7XE5bY0HRz69nnX1UC0J0DFAUuThqtRm1AXCajgP7n99Gm5BwELT8jCm7Q==
X-Received: by 2002:a05:620a:2588:b0:7d3:c5f1:7807 with SMTP id
 af79cd13be357-7d443909ecemr804968785a.1.1751075925765; 
 Fri, 27 Jun 2025 18:58:45 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5550b2f2532sm630248e87.252.2025.06.27.18.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 18:58:43 -0700 (PDT)
Date: Sat, 28 Jun 2025 04:58:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/mdp4: Consistently use the "mdp4_" namespace
Message-ID: <tszvojm35xaq3fqx4kbpqh2wa5l5mk33yldsis3wkw2b4f3jc5@gok3fhryt52v>
References: <6b9076268548c52ec371e9ed35fee0dd8fcb46ef.1751044672.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b9076268548c52ec371e9ed35fee0dd8fcb46ef.1751044672.git.christophe.jaillet@wanadoo.fr>
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685f4c57 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=z0jYOjsfy6L0UbeeUVAA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: XHx_vOh4aXV5imzkeUeE8FuWsq7ghrIU
X-Proofpoint-ORIG-GUID: XHx_vOh4aXV5imzkeUeE8FuWsq7ghrIU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDAxMyBTYWx0ZWRfX4HD5q8Xb/99m
 WkpHFfHlAy4/We3HKVr4SycutWDDnHcRw0ueSzCVFOAUOliaTPDk7Prd3G97ccQKYCeng1swfmq
 YvBVQehlymKkJS8JZd57/tlqz3u7LLcTkUJT121YN0ni6VlK/2ZPjUgkMyT5TAO6CNEg8uPG3sb
 V4CY3fjg/yk9AskrKojkenR1Cp6cptNBPt2xzgWCQmM5KfQVc20NcLUi0+Qy4FQk4y0xdL/zcT2
 eALLrMy1Z+iqKlDMP5zwAQeaB5yFHU2UGxmv+wv/H2ikF1/71f+6DUtVN6oL7ByHJJQ1XaAOKuq
 aaEBNxh/O64dZcEq3CvoJVwnFvoB7mkZn5jaPi7Z14GPvP3UEH73uvUuNeiShmOHEZj1ktauAog
 L66LugoLS8oWfwJ68qIplDQy651zwkmOWfMr7UWS+Z3Y2edp3LWE+PImKyEyX5Qmok0tFyvK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506280013
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

On Fri, Jun 27, 2025 at 07:18:03PM +0200, Christophe JAILLET wrote:
> Functions and other stuff all start with "mdp4_", except a few ones that
> start with "mpd4_" (d and p switched)
> 
> Make things consistent and use "mdp4_" everywhere.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> The change has been done with:
>    sed -i s/mpd4/mdp4/g *
> and the modified files have been compile tested.
> 
> Maybe the comment "/* TODO: do we need different pll in other cases? */" in
> mpd4_lvds_pll_init() can be removed as well.
> A similar comment was removed in mdp4_lcdc_encoder_init() in commit
> 9c2f63da6a70 ("drm/msm/mdp4: register the LVDS PLL as a clock provider")
> 
> This has been waiting in my own tree for years, and popped-up recently
> because of other changes in the same area.
> ---
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h      |  2 +-
>  .../gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c |  2 +-
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c | 38 +++++++++----------
>  3 files changed, 21 insertions(+), 21 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
