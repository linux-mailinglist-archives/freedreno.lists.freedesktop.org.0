Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E23C87D0B
	for <lists+freedreno@lfdr.de>; Wed, 26 Nov 2025 03:22:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C04D010E0B4;
	Wed, 26 Nov 2025 02:22:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="M1b6sxjb";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hn7JYtR3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9EC10E4F6
 for <freedreno@lists.freedesktop.org>; Wed, 26 Nov 2025 02:22:05 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5APNM4FI4048392
 for <freedreno@lists.freedesktop.org>; Wed, 26 Nov 2025 02:22:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=5qlJm1PEgSWHm2a5dJnrXFBs
 d/b2sDxumfwZyTWBOXQ=; b=M1b6sxjbMY/yyo/2Co895konDqRTAOrFpe2kt+qN
 2Y2FiSJ8Rf727VFurzlCWB/Ll18NjwKoeLBrWlZIj9a89sioZXU4UeM5kgXi1jYz
 a0PjtJ13ejfDWydlBtQytL2VbMCNMZ6Lqv/cZUT42D1q6z2+409JZ5m8MU7+PSEA
 QuI/z3DgTIn5cDyGPGZeMzluToAX1YgYfkQ9UFCYxfhXqRoPUpRfCgl2kN6GLGW8
 SA8nf0VA5f7uuR7DwtmyYbThyBJNRan0d5gGD+i2wAHBe/LYImryuGKNjd0Xr3hS
 T2QqUxhRKdiLm/My0HuyXR88jcKHOQjzuoEFFJvMU570DA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anp2ngb3p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 26 Nov 2025 02:22:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ee0c1c57bcso238099511cf.2
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 18:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764123724; x=1764728524;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5qlJm1PEgSWHm2a5dJnrXFBsd/b2sDxumfwZyTWBOXQ=;
 b=hn7JYtR3qWgYUIE6jjAMDfX+uGX1LwONl+x2P0GtySqNoKcvGWgV+y8cg6mXyh+Qre
 eMU4lU5tY9FBwrG4dUCSisBHWCuioIEBuu1/XWherEi5fNbZ7un5IkiVx7X3B1rNullR
 Y7RJSwuHqdSNZHUDLM1CzYywbbdpgaXf+THNUGJTPQliWywHzpH2iXthJVQ2KW1gtKgn
 3qTw9tlJeB9jbEq+Zq2T4JSIJfcBemQhOZzG9k2hfl/uZ5/LT2ud2kW3ZZw7WsqP1j98
 2+FQMju32FI335H6zPcyQtYsqAy0hinzUMyHnw5knAY6MwcHQsrcmdYqPHqDMwTlpK+b
 kk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764123724; x=1764728524;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5qlJm1PEgSWHm2a5dJnrXFBsd/b2sDxumfwZyTWBOXQ=;
 b=ZiYywMp70p3A1H1icgYCATURey4ElWRaYJVa84TAbx9YsqlLbMnLmV90JioHQez/Fk
 IT7pNbFriqUqRhgnIlonv6i38DBw02MfDVlmpkzbGX8g/Wtmf5Bozk7QK0751H2l8deF
 7l1mt4mHYCfh80K6fdhkpWqIqh/jnXrI5Gyccv546xL9ZFLO+NhQzBJq4MAvuZjN+DOw
 VGDD21yyRG+oUhXaC0O0jnxD0wfze9d+1thEiIVqa3AnQZkZy1NvpRyxm/KE5pkPSal/
 NiI2+tqBAXtT8TLCUjH6NdFnlZgoCP4rayjkdXxQdbMBP5HY+gYeG3c81g2Zvp64vmc2
 bGhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlHmFneLGk8iKTYts0e9FfkSDna70LQhc23sx70U/SgoHkjEJuYqU4xs4QwDvaK5kd2hlcWAin6q0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdJzcp4Dkdssp3uO4XEH1XsY0Nrx4Nzr/MEKHWuek05E25AoXU
 N5ZJgMprvUadhwA7kFWbSEpaebjS2eX+K5HOiW3TZRmMbGD8+SdHt12IKfBEhzTaMArbgtN1SVr
 HAOb+TZarYVyf9DCTkLQqh4dbS4IbA9Qd0l19YipycWAQ96aCJ3PyNLuM5D2t6moKPccvP9s=
X-Gm-Gg: ASbGncsMHBx8CkVLfWi9PjiZhDM31tCsdq5g3RhAt/BxWbP4AOzPqYQOfwVNs/tQR29
 51EsVX3nLJ/Fu/Ty2qil8EXj1ehwSB8PvjorW9ZLZIZmgJBzRpGxsVPv5vvTrIJVAlwgRL2KOWA
 8heMrm4CJWyUxHZaeCjAfaIoMH2bxM6Mt+fJQLQS5seZ6GVFiaSsp9DlKSfsvulT4pdaPlQDois
 XzyFGhcZlhBMJzoIZOQc/bm1j3D8ri9omRvZ2Wgzgwen5i4/XmkEWt9NC8ikG2me6F5VN7ZHJUG
 51kpjepDwoZ/thP0AXgLW4TStHBEtVOMoHbGIoc3kaWVF49j5a5FnMrjjE2iZgUxexxOgZW2w1B
 memdpBpgfojZjKDw4BfrRFDrfNinvh+HqL09deR+Er6/PGLlcS8NgKzcffV581VLHgZtuVdtr56
 M=
X-Received: by 2002:ac8:5f88:0:b0:4ee:3c15:f3e8 with SMTP id
 d75a77b69052e-4ee58af8ba1mr222371661cf.76.1764123723914; 
 Tue, 25 Nov 2025 18:22:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVLUZPGR1liVRkso5mzj488BQHwRs7zWR74Ymgv2jrMJBZwQWKhUivIrdNTXEgADPB9mIxOQ==
X-Received: by 2002:ac8:5f88:0:b0:4ee:3c15:f3e8 with SMTP id
 d75a77b69052e-4ee58af8ba1mr222371311cf.76.1764123723515; 
 Tue, 25 Nov 2025 18:22:03 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8846e4682c7sm139564396d6.16.2025.11.25.18.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Nov 2025 18:22:03 -0800 (PST)
Date: Wed, 26 Nov 2025 10:21:51 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: Re: [PATCH v2 08/10] Add interrupt registers for DPU 13.0.0
Message-ID: <aSZkP/8xK+rdCkp9@yuanjiey.ap.qualcomm.com>
References: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
 <20251125064758.7207-9-yuanjie.yang@oss.qualcomm.com>
 <5ncorvgosgt3w7flwtwpnsw7hg2js6inlyfmidds3ozt5uk3gd@7t47ilh2jtwq>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ncorvgosgt3w7flwtwpnsw7hg2js6inlyfmidds3ozt5uk3gd@7t47ilh2jtwq>
X-Authority-Analysis: v=2.4 cv=KerfcAYD c=1 sm=1 tr=0 ts=6926644c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=smo03e2hCPVHdcU4MTQA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: qzze3dHstyYQBg0OmrLvGMZ6q7EcXeMN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAxNyBTYWx0ZWRfX6PWsLPvXHFTs
 IJCCJiBCftehoJzLH9xbu57A9mK5hskdTndh1r15KriE74alkkcg6ds6PBgVZyoISOsVoV1n5gF
 EEhHKy4sLkPQh9K6XAIQst7OPKc72+lzwMEcnBRTmYuZ3e1a+Oxc8326yPM7qP3KR7j3oGASV/+
 hH/qdJ5zyt4VJOdkhxq1mutfab1lFxo9xiF0UyKkRIJrbZd6sMXkCnY4TrNKs5Ze9t4q7SNOyne
 1356J/fN7h/9AQUMGtn3K8Qf6e/fvp9hpu+ScCNYDOsQEIiC6ylhXs6ZHWkbTPvJCKv7YNiTb1j
 biNThz1MUX3BKaOy2dxVGvORWFGThn99EOKtjnbUDst2rntTNA7t9A8meca/M4N8dcWQ2kD4gx2
 jOSnOFWVgHT2KYc9KQwYwtxDYBu6YQ==
X-Proofpoint-ORIG-GUID: qzze3dHstyYQBg0OmrLvGMZ6q7EcXeMN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260017
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

On Tue, Nov 25, 2025 at 04:50:13PM +0200, Dmitry Baryshkov wrote:
> On Tue, Nov 25, 2025 at 02:47:56PM +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Please prefix the subject according to the driver customs.

OK , will do.

Thanks,
Yuanjie
 
> > 
> > DPU version 13.0.0 introduces changes to the interrupt register
> > layout. Update the driver to support these modifications for
> > proper interrupt handling.
> > 
> > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 89 ++++++++++++++++++-
> >  1 file changed, 88 insertions(+), 1 deletion(-)
> 
> The patch LGTM.
> 
> -- 
> With best wishes
> Dmitry
