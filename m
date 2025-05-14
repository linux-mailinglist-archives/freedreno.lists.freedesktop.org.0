Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A62B8AB75C7
	for <lists+freedreno@lfdr.de>; Wed, 14 May 2025 21:23:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 807A610E6F2;
	Wed, 14 May 2025 19:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rrg3c3g5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E04E10E6F2
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 19:23:41 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuvga015135
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 19:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=yni3LltaA+0t8FG4nm2JYBtt
 /uZ60urKlv5zgXzidKY=; b=Rrg3c3g5co+tTuf+LdMu2tXpZFIPWU+w+dBOXMLw
 WNs6nYDjR1A8DgZ5YfHK/8Q3AaCwBlUK8axzq6vPToPmEJc7yQIWgViERORCbh6F
 0/aBMhSi02ITQi6F7qJfs0f5iewwlE8V+67c4+mui7Np48RuFiCWxs3FsCY6HpQG
 x2Yengs2V6ehaqoI7b8rYGEOljnExFGNaCnxERl3YiKaLYHsBlNhHh5NNoP/vZmz
 vwITdVi2iT6tK46AD+nEkhZkJfsPiG0vRQthZTlLfQddqY1XlqXPQUhqxdZOE7+1
 Xo9DRmxCRUZlBlKNzgGwQSZGdXnMLLy6IgXZRFMtexxEbQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcr3r92-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 19:23:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c54e7922a1so18594785a.2
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 12:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747250620; x=1747855420;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yni3LltaA+0t8FG4nm2JYBtt/uZ60urKlv5zgXzidKY=;
 b=Rdo7SE7PotwUTqAHqO7J8XK7UMXpYVwrX/M3r0hdQSAaUilXyU1BXC39OYRN3CPaec
 fnINpFdXn8Sl95+CUmS/psJDKkHWW1/onoOUwGiZabxMaADKbhp4wTlgmslcdX2NH0I3
 u0ZTvJ5RqGSOr6KfDDvzi3nFf3SaXb0Ngg4Wct1KmTFuOdUR5B/HqkWYjF/xvh8dqAWe
 6MUdl1xChbDBR/xwcsjjnyBkly5xrcsSCIV+2LrjxyFPaRGLf5P+oNCGG6s+/cQUg0Ol
 m9WelQsFic51jyBqVqPxZhc2iUtgsbtxqc3q5bakgkQaWNTZQV1n8/gKaxkWEI20Y1ED
 O7vQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtMwvMO9kCda1Wftm2quI3a/hkKRJw6u2j854LaHyJBuEzTFdOeZyuC2rmgOHiHnSC+HNAM3h2oGE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyj0+Emb00tEXImHLkLvZOsjVFcQ8fwU3oXa9UKHwxCcIe01Hx9
 E4txWSYQ0BZiSSRL6zYPsHg7UbTgQ6Np0ii2+W08tnvp8UZoquNsIhUVg0Yb9SpGYBI+pVqy6NA
 HMfLwGb24S1iWTfgJezsXWH6NdZLICjHrU1MtwRvdEe5kqFBWjbStzGHMoVbsgf3xj5Q=
X-Gm-Gg: ASbGnctY2rHIqzZNpfRtisuP1xNAElk20ptQ0XuJVbisWuqjyIhOjZ2mQX6U6rrVgcW
 z0eUa18X1siwGPj9PSQX5QlfhzAL7r6aML8lcXO4tgBZJbQ031fwWVsbinCd34rG95ulHwN/LcC
 1NV4qDcquL0jeFsPgiJJTcG42HofP/84hAa/LAoZLjlF0KUD1j/2N0GuxE9ZHVaFh9cuKOyTGa9
 eAkUdpDIDVV8lYJzBJFmO7hq8Y76sAiwaEMRRh03JzoNtgorO2yYmVna4jQ64aovYPdSjq642GO
 FYigy8/boMJQ9AYB1qDh6cQKIcTOs5supqIOXIQQ2qOd/Cior8cFagEKjpCz46uQPtBxJg4zsoI
 =
X-Received: by 2002:a05:620a:1a8b:b0:7c5:407e:1ff8 with SMTP id
 af79cd13be357-7cd287f8fdamr535577985a.2.1747250619578; 
 Wed, 14 May 2025 12:23:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBX2PjHSIJlvnaBpvy/6NraZk7yT3imlz6y9snlTUgoROJLWl1hT5lxeeviHrQmSmcw02csg==
X-Received: by 2002:a05:620a:1a8b:b0:7c5:407e:1ff8 with SMTP id
 af79cd13be357-7cd287f8fdamr535574285a.2.1747250619083; 
 Wed, 14 May 2025 12:23:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-326c33b7b2asm20255511fa.33.2025.05.14.12.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 12:23:38 -0700 (PDT)
Date: Wed, 14 May 2025 22:23:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v2 13/15] soc: qcom: ubwc: Fix SM6125's ubwc_swizzle
 value
Message-ID: <lkkwnmnk32igcev3gykmtxsohyskj6ehylaypg2dyxbedvksee@lnuc4lfmzrkm>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-13-09ecbc0a05ce@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-13-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: a-GqcU1jR-Z_4dEcE-nIWuieaHs90Jzt
X-Authority-Analysis: v=2.4 cv=Auju3P9P c=1 sm=1 tr=0 ts=6824edbc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=jk0O2evD6aPmCTIX_U4A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: a-GqcU1jR-Z_4dEcE-nIWuieaHs90Jzt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NyBTYWx0ZWRfX9ilzlEzvFYAr
 77XKLI2QhCQG8dhZGZjYfM1jHonHn7mOaOjOP7faw/usPNgDYGvPWfsgVORJqQKGYDCBkmPVwmT
 OaLrqAAQzpBfSP54K0vJg+uFf10Tk5KLwKqVJS8ydBpmKjwwyql+Tqd7tQQa15O7mcnXsYCoUjj
 cuz/K/I4xR5gVUE10PdZRQDO26xfBkIeLAYNRVkUgVauwWMO0uhg5hU8N/37mdG86kroTVIJsr3
 CfTad3zrygSjipTgpKKYtQnbjgkaYGXl5RUm6wY+MOkxJhjZGUQ10//sGfCTodeuUKhXkMD3CqT
 j/krVHdqxOve3/7wScTBDYptF/uyC2lO3e4o/DwN8yrRHzh5IL+VBcZTU2PqaMx2peSDBMPfsF7
 lEC7hQ6K1Ol81II9nZHuWiKdQ3f7rqk/TzboaL6Ttjf8pFCMvspUjx+E8majdVJvzK6cq96+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140177
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

On Wed, May 14, 2025 at 05:10:33PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The value of 7 (a.k.a. GENMASK(2, 0), a.k.a. disabling levels 1-3 of
> swizzling) is what we want on this platform (and others with a UBWC
> 1.0 encoder).
> 
> Fix it to make mesa happy (the hardware doesn't care about the 2 higher
> bits, as they weren't consumed on this platform).
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ubwc_config.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
> index 9caecd071035ccb03f14464e9b7129ba34a7f862..96b94cf01218cce2dacdba22c7573ba6148fcdd1 100644
> --- a/drivers/soc/qcom/ubwc_config.c
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -103,7 +103,7 @@ static const struct qcom_ubwc_cfg_data sm6115_data = {
>  static const struct qcom_ubwc_cfg_data sm6125_data = {
>  	.ubwc_enc_version = UBWC_1_0,
>  	.ubwc_dec_version = UBWC_3_0,
> -	.ubwc_swizzle = 1,
> +	.ubwc_swizzle = 7,
>  	.highest_bank_bit = 14,
>  };

Add a comment and squash into the patch 1.

-- 
With best wishes
Dmitry
