Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D27AD262C
	for <lists+freedreno@lfdr.de>; Mon,  9 Jun 2025 20:54:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C354210E435;
	Mon,  9 Jun 2025 18:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EafUsoQF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA0610E435
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jun 2025 18:54:57 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559H01Wk007286
 for <freedreno@lists.freedesktop.org>; Mon, 9 Jun 2025 18:54:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=bdYSp294Kmo6eHdYI4u8F4yR
 kn866GRiB5ZbygzcprE=; b=EafUsoQFjER9dtK/DAMY4LtUOOHr+2JZ1yPJzRdm
 q2RztNB/stSra0seTjs1t/+iKMNLnLqWprO/h/B2HRCkBMpcBFmcF9gJUFTu9GGg
 U6kSzocK/oO7znsssoliJgh+8iqOomiIoX4F1piOPOg2osW2vsoyrwlpIXyEMshl
 53isUTrcBzHn55p/R7TFzfcrEJni4fLX+BOaXvl33+H4ulKCfv3P+D1MJBzFrQ+g
 mRCRSEIufOza6QUatZCtFy7/2YVs7VM7rcfF31ia5hFHL5S7lhlCBg+IOXxZbOlI
 KNjMI0ny9yuHkgdY+z5kRcwZE4GW3eHjSdXQceHJaY+2+Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2y1qx6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jun 2025 18:54:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5f3b8b1a1so813654485a.3
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jun 2025 11:54:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749495295; x=1750100095;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bdYSp294Kmo6eHdYI4u8F4yRkn866GRiB5ZbygzcprE=;
 b=bQie3/N/iW8S25QQER9ooq3BhM6+/e3Al1CaRPQoIyR9l3u0G46j1R2McNXtvMz5fd
 qpZs4faO4Q2NxGoVakfoVcjk0CJn2bWtZ82ljH5R1NV3NtBWWjMndwsGLkkJmXk4FHkf
 /YrTYGu/MA7LWc+xieyRKsjRAGfbrXPZP7qr/0at9a3FuWbTutq0Xh4pPzJK7DBEBqQ3
 ghHFo6bClt8NweSrd1Ox2gbjc7UPqxoXmHeFcj7DMW1Z4SguM5FcJ8d+iMGHv35Ml4mJ
 BYPoc7CvQm6JwlZPrlc6vU6Lz2rz5GASNKtuy20CJhlnLXs0PZPUjts53pOY9d1fyytI
 pdFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+EaLuNVdvIJTQZsZUDA7XX0yVcF89YQ9U8wKMx4sMo+Xa47KMwZSUidtG5M6Sox+wWgf5O5IcZEI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySqlCLhiynk3FZ4/I7K9YOQUMT4Ibw+zslqBdwqqe49FoTyQif
 OHrVKDvGrZXcDI9TGrY6n2oyq/lJcTDdvagYKijLb+FqJ7Ya67xfugvg0+hHAli5+VW1LDraZui
 V6+5f5aIiqCDGOQc5sy2PmZYe97e5bkT6KSOXPk9U51HB1CxohmqqdbseXEmEQh+4Xi/I+WY=
X-Gm-Gg: ASbGncuXT/JEIP1ndFM/pBiufE3mL0QRDcKZYUmpHJ8obpmeOPgn/aeNfaA6ST8wKT9
 jRylMpytEAn/aaAeGi6kL3o++YQ6MJ23A5WnE+5uKYWi9zyTmZcyz58EplDh+lAk/zxRSULeKSC
 p9ZPsvMPTovpvcsYZVq6+zZroZQECCLxVGR+PXe2Tvo0LwEauK9HD7l7mzFvjtaKCUvn0+aWcu+
 T8SwLeT1H8XzkrXrQFxCCNwguPK2n5sVdUW8+J4QUcgdsqyya0RvtcoG5ObYdPbx9BCBvHV9pWs
 p/u878SSQxyYxK4PGpXaTiqixzy+gB+NuNYaVENDUoEYSQJObH48GO07Jtd30zU3a2GEtRzmcyE
 =
X-Received: by 2002:a05:620a:6a81:b0:7d3:8d2e:1f69 with SMTP id
 af79cd13be357-7d38d2e21bbmr731860485a.17.1749495295550; 
 Mon, 09 Jun 2025 11:54:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNLps+ki1+SdzxXPF5sfV00WqC348swYXpemcq1eg1DxuJ4nAqN5qEFtZ4+PjRVI+oaARS7Q==
X-Received: by 2002:a05:620a:6a81:b0:7d3:8d2e:1f69 with SMTP id
 af79cd13be357-7d38d2e21bbmr731858585a.17.1749495295248; 
 Mon, 09 Jun 2025 11:54:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5536772a1e5sm1291949e87.141.2025.06.09.11.54.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 11:54:53 -0700 (PDT)
Date: Mon, 9 Jun 2025 21:54:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] drm/msm: Rename add_components_mdp()
Message-ID: <c4myfvymbbg7likuahefxtuscskkreflyonx4moul4dqnvmjog@mzzz3qrlsocj>
References: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
 <20250609182439.28432-2-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609182439.28432-2-robin.clark@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDE0NCBTYWx0ZWRfX4Z4I586TvTGE
 aeL+gPtRSUQ+bUhA+FW+QxB3Z9plffiOH1/SQESFZOpdNFlooQIRPoxGInqT2RcvQocnt/bSdz0
 Hl96LdR22RmRSTboW6MLT/Ja9+s/ebBqb6ru4/Uzu81CjIvck5wFyAby1iE4spT1tLYYi9hgtwc
 IB9ymGDor8fSjazgli5e6fjv2FqmdD3fZWI283IjqfeQACBqOTSRE9b7m8fq96FeWqI6600pJNV
 8drkhT3RzHdpoT/oHnkHgVpW/wSn0q+0SM5pitpv/5zYJnqS448a8uTMfZcZtI4UTlzPEuki6n8
 pRl0tPnhpIzRCWVIZJ6CbTZJ/aPXC3bp2rLoTpMEKBnVeywrB3oQNIm3QQOWCauLJepBrMAbMj+
 1Mqh782J+xWnt+7SglboaeYxK1P9Y+iELAdPjUiQVMxxAQO4otMm02pOXNQZp/Xs94zYTsQj
X-Proofpoint-GUID: wme640DpVb7rJCm7q9FFDWwDt2vT_7Vc
X-Proofpoint-ORIG-GUID: wme640DpVb7rJCm7q9FFDWwDt2vT_7Vc
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=68472e00 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=-2mmMjQWwNZ6YRhNbUMA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_07,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=741 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090144
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

On Mon, Jun 09, 2025 at 11:24:35AM -0700, Rob Clark wrote:
> To better match add_gpu_components().
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
