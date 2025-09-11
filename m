Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6D0B532F1
	for <lists+freedreno@lfdr.de>; Thu, 11 Sep 2025 14:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 540DB10E318;
	Thu, 11 Sep 2025 12:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NF+KtG0d";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBC710E318
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 12:59:12 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BBJxMJ015492
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 12:59:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=erQHYt3izy31hhOi7nQaR12L
 KzLFsLkvUdjCmOIgf4U=; b=NF+KtG0dJrO+Jah9l4R1SQCTtI8Ig4bugDgBUDB3
 Q+tnn9DOXj9Cdz9U2r89R18AiyibwLhEt8DN11Pj8TQP8JWJhLN1zLjqrBwte5mI
 rCNPLEzQ10b8nRvzPYoumLmEz8KrYr08erJ62L6GSFvqhcD+FGAVmVrWR3O8zpm2
 k9G6G2ZqzfkYjaYQoIahqe4wAkekDbv19idhB7aJOoFpz/iURoLabuEBuL560VLx
 LvkUoruTmoYuB3hx5Nc1SkakwiaIm981eiz6gPJxXB/IUow0/9/i2qHFV1bS3qQs
 0cEa4M/bjyT57glR9zrEgMfQF3yOzzMmEnHmvMJYCwdaIA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m7k53-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 12:59:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8217df6d44cso72286585a.2
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 05:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757595551; x=1758200351;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=erQHYt3izy31hhOi7nQaR12LKzLFsLkvUdjCmOIgf4U=;
 b=aaoWPBMUrkc+EdQTnlBrJqViDsWuFvolbxDAy1kqwxKnFNngfklj6lAtmY0n56XjqE
 bTExbRURjnmjL2d7U58cKxGXrBGGLcJHK5MKbbKM4yU28VTRZx+yiUwJpF2FXslmBO33
 6pseKFf5FS65IjCv89E9NS/UxYeXB2jnTQ3o9RLQy43xMjc2dTVscpP7S+4UuE+58T14
 +oQ2JfQyFJghiHHExP9XQ3G7cDM/F2/GZryazBFYC1fm0VZtho1roZGvXrSJfoIiABtz
 VVgAiR28CRAOwdN/re5YGMrI8IofOJ3WppA/FrcOa3JfL7hOQkEyLBLeJA/e93DQWVtm
 XBZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQcyfdPZSQP6J8iDAnwYJiT2IVzK6QkwNdumhNeIGM8BJl1nQyycFEI9l771LJARYzpmZyzj3yJFE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrljFuxMfhRUDeSev5Q7BL647JJsK1FGf1j2skQMeSlef4ohbC
 4aLamY14cbMLT7sIW40JyI5lRbXA5gsCIP2PLMHBqLhLEEnfK1HaK668w/De959ffiJwzjqrOWs
 3uIPNpuBrYg4Mm56o/ZbDSbv5UP0ISzNyisvPisRGRsJtZGrXlTJBRCXHhp8oBYFP4c3cJ/s=
X-Gm-Gg: ASbGncte+YZ33Aj0ry60qfcwDJIqiG/3P5WEGVnoMCUwmrcx6czZy6JtPh4m+8So2Xh
 ak74CpSvE1lFcrK1nh9tlSgavsWeacjPBsvAlH36E/s1I07Xv4Q58NyghFCJ+mtSFZxET3Sv8G6
 X3wsI50mxGzg07LuS+hq9F6o1yCyGjSHXggnxiGK8D9ujFCyv2rwVx4t/UPNhHbcA7llLomdjf1
 aqRvI4AdqPQozswF2FkCaRNSEhCwTHEdBeEYSMAUSUDB/bGjpDPipcp+Nwb3yl2/4RUwhCiVWUS
 AwVEIre0Dmo8b4SPjO2tUe+BiIizcZSGBmiYfFzbAHuwPjyjFLaBjWpu21d6jCCCvpeTUNNAhuQ
 SaIXtbdFzUJQlDu5pPpvaZiPqfNR8p9OwNRc63ShyIZM7jJ2/LZxw
X-Received: by 2002:a05:6214:2a4a:b0:729:9ec8:a1a6 with SMTP id
 6a1803df08f44-7393ec167f7mr231642686d6.53.1757595549403; 
 Thu, 11 Sep 2025 05:59:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELAL9kOk9qQGqQpSk7nyLvkiKnEOMoOscLtU6SuZkaDa8BaY8uCBWjurK/6Kut9nEHxlP7Tg==
X-Received: by 2002:a05:6214:2a4a:b0:729:9ec8:a1a6 with SMTP id
 6a1803df08f44-7393ec167f7mr231642076d6.53.1757595548865; 
 Thu, 11 Sep 2025 05:59:08 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e65a31a1asm400573e87.134.2025.09.11.05.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 05:59:08 -0700 (PDT)
Date: Thu, 11 Sep 2025 15:59:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] drm/msm/dp: Add support for Glymur
Message-ID: <gteqgamsehrmaf2hro4uhqydckexjlvkzlpkj3xyt2w2derf6t@evk22k5y4bpb>
References: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
 <20250911-glymur-display-v1-6-d391a343292e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-glymur-display-v1-6-d391a343292e@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX/m0tdmfG8TbU
 XD82YY38kp1q0FHTqNFOgtvE4uWGwy9+rcZhPueVBHWcV99kSZLKA+1m2RQ0ZkuLUdp3N3TixB5
 puuuyFlW8VClovVcNd96r5pCRBEZ0KLzOvYjxnw6YlMuQrP92s7nBZRASRSOph9iH0m9qFinTBT
 J4ZvIP68MwvlIt+rb47lp3UfcEb5ZVzmJHP27oHv++30X4t4wegH180Hcf4T69DMBhQp3SmBsIG
 n0eIuC+90EzRyKdrhgvhkjHT/hEmDdHZUiNsusMaEF3w2XReT6Xxil1HTXh46D3EWCMOYN5Sah5
 pVxQLrBtnGG/Sq/5AU4GC2m1sqRQYP2OUrUiW93nJOPCQSg5mcev0CxzBf7gxzISFfIzorFVEMl
 i+amL3pE
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c2c7a0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=r4hCbaOVonaLTjXU3fkA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: jlIlpb8bpYFovMlZFio78RXjUezDdwQc
X-Proofpoint-ORIG-GUID: jlIlpb8bpYFovMlZFio78RXjUezDdwQc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038
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

On Thu, Sep 11, 2025 at 03:28:53PM +0300, Abel Vesa wrote:
> The Qualcomm Glymur platform comes with 4 DisplayPort controllers, which
> have different offsets than all previous platforms. Describe them and add
> the compatible.

It's not only about offsets. It has different core revision, so it
varrants a new compat string.

With the commit message updated:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

-- 
With best wishes
Dmitry
