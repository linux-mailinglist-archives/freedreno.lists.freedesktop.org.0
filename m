Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2A9AD219F
	for <lists+freedreno@lfdr.de>; Mon,  9 Jun 2025 17:01:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B89D10E405;
	Mon,  9 Jun 2025 15:01:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvYQepXI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C170610E3FC
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jun 2025 15:01:37 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5598PGcM003755
 for <freedreno@lists.freedesktop.org>; Mon, 9 Jun 2025 15:01:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=eeZOilRRCfOoW7ivyBUSV/3B
 oCRgS1D3Yx7wgvq5hHw=; b=lvYQepXI4nKWo2BFshP/lyWx27i3MIHxl5bxwxfq
 REhRIDK6coQmM/cQT9WPUnEZhgiMF9KnoyM9CQiF4p7lX2QlNwm/ys9HgZXpmUPy
 Ibc/uJU0BJUlFSIBQ/G0URsv83Q+IdbrCvWbNmkF1Rhw9CKRgZ0N3e/Bpluz7P/1
 G/tMK4v8CtKr3qkMvJiShjbuClv6cRtYVa4QJupiv48Yiolh2wMgQt+U3GNPznEa
 V6qSeMvSZGtD/31/B/pt+gDkBZZB63eR8daTXFhA3YJpMaXv+zXgwcSRyIA/eONV
 iZXCYuDg2PjvVpKunDpKjlRRkgv/ajflrz10sirbfr47oA==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2y1536-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jun 2025 15:01:37 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id
 006d021491bc7-607d4777b1dso3262658eaf.3
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jun 2025 08:01:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749481296; x=1750086096;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eeZOilRRCfOoW7ivyBUSV/3BoCRgS1D3Yx7wgvq5hHw=;
 b=wpLMzmpv3gLPvsmcx4A8MK6+aEUhX6GlTT0C/p5hAJ33bHPyLMiQgjNpfvijwjPIBw
 eoaDoycWy8QH7SjNe+KvIzv/uIdGTjgJN+XhjYHZXkcUFwr0PbtINWdFUQ9BZYNrdzzG
 xzCiIUK7t3u62OvN3IKM5+swms0kcy7PLAq2oPRZl6h56XuIrKofxucFVH+qOPZ2It7I
 3rU/R169XX51BmBNFGL9bEVmqFim0BYz22R7aHuFko6ffbLZRUJ4I6+oL7IQAoRJJ/tR
 QbrEvbfOOn1Sn7h0lMxk+uOdRiho1GZDkkLH3EVgRnPF0rFh62ntINFlNpGjXofnRpf6
 SZhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSiweIv2IEo6f84MEPUK8jvAr8nMmYRBciOkgMrbZOrbj0xlGUjz39Dt/UH0JPhUCzDiFKNAFS/qI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywj5WmxZvedwt4tAbxmDq5vhZ9u5BDKgkW5t5t9+dw86YudPAOj
 zdXw/jwH3eoaJZln4C7Xwm7E1K9qUt1ViJvAkt1ZD90QDWGAx4dar1HScDy+ONyGIyN2Jc7JtRj
 v2GcEnupzNreOoCB76nqXkZ7XVvshlIeZJZYCIfNmIZIRGp3qkVYQAzlAYIlEodaZ6q+aY1w=
X-Gm-Gg: ASbGncuzfcV9IsGpX28wZaAM4ukU4rs27GjvKbeaDLOjfrs0iwdMPummwpblpqzstJw
 tF4nf9L/Y8alZY0waSab+CBYm8FNWJ7ahxikhpSoPchaqxwWk1BTRAtKXV4BMUQUyPD5jAZvZBG
 KN7TAIWumAWnEbn2p/DgjXbvSq1jZanNqouEoYzn2+rLmJAD6eqHkikHt65Q8XJlNK8Yt6TaPVY
 H6rsOuHv3GTbs0xrbu1xltC1ZCkuQkcOC6PytXACbn4EGGuSFZYvePv1dS1j6gIax9V3NuoTups
 Xand89v3FIao5T61+UpFqFpTfiCumA9sqxx/66m+bCim9k13mxZ5uK+vi3d+T930tGMo03uWnt4
 =
X-Received: by 2002:a05:6820:3102:b0:60b:9d5b:e94b with SMTP id
 006d021491bc7-60f3cf05b30mr7498260eaf.4.1749481296089; 
 Mon, 09 Jun 2025 08:01:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1Fi8e/8Pp5oI9faNSYkOSpVjhnJdV9bwjYCbtPXM4Szgyw5KA89jfNLN1bkno5QUfOc4AOg==
X-Received: by 2002:a05:6820:3102:b0:60b:9d5b:e94b with SMTP id
 006d021491bc7-60f3cf05b30mr7498206eaf.4.1749481295529; 
 Mon, 09 Jun 2025 08:01:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553677385desm1186686e87.251.2025.06.09.08.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 08:01:33 -0700 (PDT)
Date: Mon, 9 Jun 2025 18:01:32 +0300
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
Subject: Re: [PATCH v2 30/38] drm/msm/dp: add HPD callback for dp MST
Message-ID: <arfmbusro2nh7axnyqn26v4rjwfmop4q4oxu45ad76jubijnbn@3twddambhtum>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-30-a54d8902a23d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-30-a54d8902a23d@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDExMSBTYWx0ZWRfX1DIkLLG8bh7W
 igGUhWNtp4N9s+GD2hn2fJoNjcDD1wHJ7h3HtPAmV3nEBGlO3quQBPMSa+YeCxbWWyAI5LanbL5
 CiThAoxEXmaIxONYNrpedtJ0Q/Q4r8zxoQp6VpNZ9tqpFwOqzBNEWLRGIDDa65OqsBa0ovFvA5+
 cxyylDV/GWKEX1/U+kxtCDGVqpN9BIQAqX6mNkFV0SdYFD6zdnhPOo8VpPRTcIxLcLm+evGvsBf
 2Chb8/CB0+rSyjYVI7jckYRFA4PkTx/ddSW6txSWmI0GrX1UnEquyeoLI7S0RJsc3SYIjeencQt
 Ul7UOqcQ9eh2PjS/Kavh8GmrVodHCrhbMBKYzZpKvTEwndX4PllByi3LdYcq55S4FYY/3g+yYYo
 uskivByc/JF0jRr+eLS9FbjxW5rv3vCAhFPcg6ZDOVNX/COnh3kYgXmWIq9eQK/zh+qclWO3
X-Proofpoint-GUID: Upa6d6Fxlez3v2fS6axSXOee0uZ8AUen
X-Proofpoint-ORIG-GUID: Upa6d6Fxlez3v2fS6axSXOee0uZ8AUen
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=6846f751 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=kZwT76mLgBx3J5xcvQgA:9 a=CjuIK1q_8ugA:10
 a=WZGXeFmKUf7gPmL3hEjn:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=735 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090111
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

On Mon, Jun 09, 2025 at 08:21:49PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Add HPD callback for the MST module which shall be invoked from the
> dp_display's HPD handler to perform MST specific operations in case
> of HPD. In MST case, route the HPD messages to MST module.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Missing SoB

> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 20 ++++++++++++++------
>  drivers/gpu/drm/msm/dp/dp_mst_drm.c | 34 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_mst_drm.h |  2 ++

-- 
With best wishes
Dmitry
