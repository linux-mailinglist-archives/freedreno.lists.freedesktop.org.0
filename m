Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5AEB9C449
	for <lists+freedreno@lfdr.de>; Wed, 24 Sep 2025 23:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A490610E7F4;
	Wed, 24 Sep 2025 21:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AJjVsTMY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F96B10E7F5
 for <freedreno@lists.freedesktop.org>; Wed, 24 Sep 2025 21:25:58 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCSw7K025075
 for <freedreno@lists.freedesktop.org>; Wed, 24 Sep 2025 21:25:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/q7ck5ZyxDPq0cljoMqHt8gL
 Qtmb0+gJMZIvbJmIoeg=; b=AJjVsTMYWe8KNtGxUliteivSdRkvmVN37VkR8vQF
 81Lr7iwa6AFnulnbbWu+5Oeqs0JVdbxizZ7SbK6cXDLnHiMCvM89NE3m3c83QY9B
 D7mGjjnRSzaVRTHUqZ56u3PTtxTXR/qlHdU89+HWgbnme0gCCt7f4hfti9q1r4KR
 2YcapPTFg3cizBULbi7I25kjZ451aa7wEkWTUWydbSWqTyQ4amxLfEk7O0Q3XA/o
 s1Bp6k7brfs1hdpi6/hf7sP/vTkC2V5Q2MVmNPq0WdXr8KUgKJDQJaTgOTt+RvaK
 k+AE9gYXmECSk95qhMes4YN0gcRbryckYbSQGagVlI92Rg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyex41s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 24 Sep 2025 21:25:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b793b04fe0so6689131cf.3
 for <freedreno@lists.freedesktop.org>; Wed, 24 Sep 2025 14:25:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758749156; x=1759353956;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/q7ck5ZyxDPq0cljoMqHt8gLQtmb0+gJMZIvbJmIoeg=;
 b=VGi4AnQ65304Qum218An2MR5EBlqImGxPiPUSKlplK00WzWHjlAnuym8/LkSXpzB1S
 HT7f1FJ02nmuUd7w9mxRxq+Twx5gaq+Xzb4lGvIZjTfHvwUSieSeuqZNwKUYlhMf2NkQ
 k/Z5fvneIoyQ62bQMCxZrdkarQC/ROLNRcsTvhrTCZI6ysYoQ/Ru7p+mHDO62Er0BeVc
 LmLd5Fyu48s3qEsHkMXkn5UhK6JwLu2svSIlJByLzMBrNz39makanAhoiGLTPZZNrzS+
 FizzJlcuu9sGrx/tOKLRqAoE491fkdM4o2xVokmCBYFqjxnAqL+1PKk17Tx6xERs8vEW
 A2Rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUh3/WypDlUHU2rQIj+EOOYgzp4g3IrKh4Jt6F9x3QN1ccxg6ORJnaDW+Twt1LO49R4gemWRHJok28=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzF8o6N3CkXYRwUq2mkEL+kGbGDlS19hg/x5JtR5+dni186IiR8
 yCi9ylibL/MsTT5DD4NYHmxcr5zmnFZy+JCz4k9GCQPyzsniqqL6AKrYi0BHAZDb8sYPQvgepZu
 tfcSBH2PueooHq4AxHVmlYIlBHSkW5YF2SokNs+tb9W//gGf6/O4+BdMs1VSau/FiOLB4JJ8=
X-Gm-Gg: ASbGncvU8Sq3YQ6LY/T2vc2wZVUTZqJMROlY98jE/ODFpIsMaYOip/uUOX6o0zYcsDm
 3ODsqpYU3Uw04twleZ0uvXAaBxr67AZF8IDn4fA7HIcjECfr9j2CbfSG2DEe7PBAkFoywA26SWm
 9uoe2lfpZ/1IjB4jShYuxtOSdt1rl1RoZQ12Tlu83WeVYwRFkH6/yR4zh0Wo6YJ1lIqKhRXelN1
 LJ0K+rVFoLbT84Y+vONdPOlddgaFLTDHkrXP13N7g2tgOrBXFwRyC2dFkbw8vfsNEJm6LbQwVQW
 AFSdIKb97PMsfCAaNNZCLgWLOayINuqjxj+QxSmNPG/V++RLUAG9zcRzoIDbTxM8uwwUOf5G2lB
 m3zX5JOmKo3wJhRdZ4zkVeAxZQ+lsOuEpnKMoO3YofisBaaBwA5sQ
X-Received: by 2002:ac8:7c42:0:b0:4b7:aaa2:c8f6 with SMTP id
 d75a77b69052e-4da4b42c83cmr16927701cf.43.1758749155799; 
 Wed, 24 Sep 2025 14:25:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFa2soASBumvR1Wp37An6aFpQ1N0R0qrYSFiiAAmklOZuBLiBN8NvuSKWYrA3++YveaEu9QLA==
X-Received: by 2002:ac8:7c42:0:b0:4b7:aaa2:c8f6 with SMTP id
 d75a77b69052e-4da4b42c83cmr16927471cf.43.1758749155363; 
 Wed, 24 Sep 2025 14:25:55 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-583139f9915sm33226e87.39.2025.09.24.14.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 14:25:54 -0700 (PDT)
Date: Thu, 25 Sep 2025 00:25:52 +0300
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
Subject: Re: [PATCH v2] drm/msm/dpu: Fix adjusted mode clock check for 3d merge
Message-ID: <3h57fefla2kv5mh2fmldma5v57do7uohljnzyd2pnkpsdugxle@ylqizvhtril5>
References: <20250923-modeclk-fix-v2-1-01fcd0b2465a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923-modeclk-fix-v2-1-01fcd0b2465a@oss.qualcomm.com>
X-Proofpoint-GUID: ezQ6KO76GWJ5PVXFJqcXXeog2tiMaVwq
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d461e5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=1bp3yVi2_WrJ7BMISZwA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX994tUVKR2h6a
 28HWqy+ZXwGIRSOfPO5cvvF0n6/KzP65DO7UGwKo9LtY/ylPSkX+QYbeBbOq9FJoeRTOW79vIvJ
 D2f3zVz9r8WWi0jSG7wxxCGnBrAQN9+fb3IgLFkdQsDKc1zsMS41SqEaahpXb4Je0c33WvZ2IGw
 oPPWQwlxA7d1gBAZiyEatm3vKCMR+DQ+CPcsMPKfxfGYh48nxxHIL/vQNs6aptnMe6XgPUHF1I0
 TunDMbaRDFTnA1vo0YNYLmrqyRyBdi6Y4Stbqzdjo75/w1odKzEwjXZsFpWV4j0J4yO1Xo5Yz71
 9jq881waOvdsWlY1qwarDNuT9is2rK9ztESzSbZbxSrq2LWeMAu5BUEVHW7fqujVHVyYKAwVXxn
 F3uzssnu
X-Proofpoint-ORIG-GUID: ezQ6KO76GWJ5PVXFJqcXXeog2tiMaVwq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_06,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004
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

On Tue, Sep 23, 2025 at 04:03:50PM -0700, Jessica Zhang wrote:
> Since 3D merge allows for larger modes to be supported across 2 layer
> mixers, filter modes based on adjusted mode clock / 2 when 3d merge is
> supported.
> 
> Reported-by: Abel Vesa <abel.vesa@linaro.org>
> Fixes: 62b7d6835288 ("drm/msm/dpu: Filter modes based on adjusted mode clock")
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
> Changes in v2:
> - Divide adjusted mode clock by 2 if 3d merge enabled (Dmitry)
> - Link to v1: https://lore.kernel.org/r/20250922-modeclk-fix-v1-1-a9b8faec74f8@oss.qualcomm.com
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
