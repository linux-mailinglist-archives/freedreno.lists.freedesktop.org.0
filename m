Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CE4B376B2
	for <lists+freedreno@lfdr.de>; Wed, 27 Aug 2025 03:18:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6558C10E6E9;
	Wed, 27 Aug 2025 01:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aUJYYuwf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D3710E6E8
 for <freedreno@lists.freedesktop.org>; Wed, 27 Aug 2025 01:18:40 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QN7VdF026226
 for <freedreno@lists.freedesktop.org>; Wed, 27 Aug 2025 01:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Bx+duUP1GALERBeSBTVPOrXM
 scOH+ezdQWGpYAtJpSQ=; b=aUJYYuwfAjFvp98BcSfP9wgOvviNGgAb3iP/Uyeh
 bBZajVeViijgS9PvK0tayRC8E663JaLFc1TW2wc9yW9NTzWdct/Ktwu3WYaahJ7a
 CvaB67tBd/ERl/Q5BxfuMavD009wwGPSnkVDuyQAEB9IukNJsbkOWYv0z4LUo4r/
 ETVF0iTRrWZ5FJN0tPoYoVPgJdCXJyerzFruYWehFJaX+uj+qX7sNb+RplTrQFic
 qgBjzpoA0uHMBSZbp4yLslNTFpbAYK6w2WN0hkhTWxz6T2mLvvPUmO+v+GsPw6NM
 mNcQd+1Wq4b0NXFQCZ0JtdXRj8rd1v5wi+Zek7+UNZDhLg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6x8axhn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 27 Aug 2025 01:18:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b0faa8d615so12306771cf.1
 for <freedreno@lists.freedesktop.org>; Tue, 26 Aug 2025 18:18:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756257519; x=1756862319;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bx+duUP1GALERBeSBTVPOrXMscOH+ezdQWGpYAtJpSQ=;
 b=Dy3IX0NYemdp8LfENKc4hzawJ3FSmDaFmCej89N4FORaaj2uVJrDDllYOLSJNYIsRA
 VkSjbLT2L6hH+tWOVqpGAoL8U7TC34DxA/6FFn38IIHPZ/bdjXe7QOS3esjAOPSgwMdK
 ER/HfWDW28+nv+sYvRnsrx6cZUp7GmP3SLV5qcO6TQdwztx1/m5b7kFvMM9VG9U/Ds4+
 DesuoBCMFBovUAMSO3dr64BsjDtkdUCAPVC3Gal9UMJiYrh6n7LKuSu1xsLtJSkeuaov
 tgB3+Eont/D5Jmpsr/ntpTrVlHFAiAy+/hLvuHWZK/Ot5h+0uNXMkPHHYj0tDzS/wd+c
 Moew==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYxfQSS3rL1eI4Ll+f5m/FyHFBKVlf42WK3o4OeXzeUhcFB5JDOHdxFIpnnqdGnfxA1VQ6Ux5uXHg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCmVC3fQbHWQb0L9+bbkD8bo/E4VRXSSnBC2KOfqFc7QtWHEGw
 7rwI1M8xz9A0788Rvopy/Pm/fuOyCrJuyAtU8uq4zA7SD1c5iIXHVstLOS2Z+WiBMQYfby+2B1d
 L4TJ30k4RAOLRegsuns/Fnxox51I1XcFZMBYZZlsSxW/pZWE0sMnVXlU8ggszkpclCrN5uL0=
X-Gm-Gg: ASbGncvbFVGOhmw0m6HJ4anck3UVpnnRURoyOmRdCPfreYAr/2yJn/SSfW12EpRwpwL
 i0LOkhus4MggLNMCTTCXO28t5g78Hr3qFC3ObumAUCKEU/moFWY81g9m0JaXEFK7M76yGQ6anDE
 C0RbuynJbVwXu503QrZidJ4vLFOtqu4uAv18P+BMcpWG2HcYmxrutU0acxn4VMV99cEnEfvBfdh
 G15oFdlpQaA5Bwmq2jEEIwnpL8pJolbPR4eSW891ynSrB4UrWFO6UPWGhx1CFpXLcl34xA80NaM
 50v4CWtsXR79uEMe4FoWuis6CIk39aGPWV95mIsfLFj2ZwgV1ixZcxG0YHTgEjY7xVWrKgdvxXI
 3DVvBiuouMsmxJtniYSbrn2BRCeKND5kyjIxEieNO6iMMeolggX+k
X-Received: by 2002:a05:622a:5c0e:b0:4b2:9b79:e6ff with SMTP id
 d75a77b69052e-4b2e76f6c24mr36188251cf.7.1756257518829; 
 Tue, 26 Aug 2025 18:18:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlWgyLt/FiqiOWOJS0LqGdTAYap/k8kB9YXuoapGqnOCEle6fLztfOxdXwebefsByFu+0ZLg==
X-Received: by 2002:a05:622a:5c0e:b0:4b2:9b79:e6ff with SMTP id
 d75a77b69052e-4b2e76f6c24mr36188011cf.7.1756257518351; 
 Tue, 26 Aug 2025 18:18:38 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35c02020sm2529995e87.29.2025.08.26.18.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 18:18:37 -0700 (PDT)
Date: Wed, 27 Aug 2025 04:18:34 +0300
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
Subject: Re: [PATCH v3 37/38] drm/msm/dp: fix the intf_type of MST interfaces
Message-ID: <pp7s4wyvchoe2en6xqtow7cw3wfjfgnb5lu2l4f26azwssolpk@ydjm2ezqumu5>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-37-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-37-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 8PGakVd84KxkAWajbMIP43SvKWA3cSET
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0NCBTYWx0ZWRfX9pwpPN7TkxIL
 mkDpI4dLCFxeDTpjS/LQQtNYS245tkSCACRDMcJHLsYfWdewI1956KkKlP5V6IwbYNexBJ/x4mE
 9wPKZnySaYoJ3G7U4kYJTa0wkdBJ5a+Plv0f07V+VHl2s2A6iajkngt55INhZhXV2V7b4ItyWP4
 pAh2UmpQMhsM/DS9v4KmZsImb8A7iOBa/sk2CqJNpT3gAzUqdr5Ya+yysOsG3veKGlsiLkrMAe6
 jc4CmXg7VFuXqNiYWzd/eSXuFIajVTqWYz1qtw+XD4d382d44k9bvYzk3hz+N3pzZWMuQGKCuRo
 j8U7OPcJuyvV7xQD+o4KS/RZHieLoxtiRr0J35LjYuwpun8uyG7DGQw03LB0+7SdJd/ks2x0P2p
 LcPOwZZz
X-Proofpoint-GUID: 8PGakVd84KxkAWajbMIP43SvKWA3cSET
X-Authority-Analysis: v=2.4 cv=Ep/SrTcA c=1 sm=1 tr=0 ts=68ae5cf0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ELchz9PJ39Up9ouDmgAA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230044
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

On Mon, Aug 25, 2025 at 10:16:23PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Interface type of MST interfaces is currently INTF_NONE. Update this to
> INTF_DP. And correct the intf_6 intr_underrun/intr_vsync index for
> dpu_8_4_sa8775p.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  6 +++---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 12 ++++++------
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  6 +++---

Also, as far as I remember, INTF_3 is not a DP1, but DP0 MST on the following platforms:
- 4.0, SDM845
- 5.0, SM8150
- 5.2, SM7150
- 5.3, SM6150
- 6.0, SM8250
- 7.0, SM8350
- 8.1, SM8450
- 9.0, SM8550
- 9.1, SAR2130P
- 10.0, SM8650

Please update them them as a separate patch.

For this patch:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
