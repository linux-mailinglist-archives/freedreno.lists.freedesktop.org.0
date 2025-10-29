Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BC1C17FDF
	for <lists+freedreno@lfdr.de>; Wed, 29 Oct 2025 03:05:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71ADB10E6D4;
	Wed, 29 Oct 2025 02:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gi7/LrHo";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dO2l4J03";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB66310E6D4
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 02:05:28 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJle5M2575860
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 02:05:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=oNYnTyhROEtSOeCA2ONPfk1z
 k2xXS0IqmDQAJE9y2I8=; b=gi7/LrHoeAiQsPm9Ov/wB6nY1FRSi/Il3LJHMdth
 McGeaav8atOxCK0TyTyVlqp/9x4KwHim/nqRAZzRj1HEv+oT8OW5pmm+P+sVcwrI
 VCGnfCW3XhaE0kQalC6q/eVgw2Rq9oC33yL8pdwI+BHj0y4fGEmlqkaF5Pw2cOxF
 gA+IkmL4zajq/2HU+SutIuFDEey8MeUy623VCPLohF+0DvyvFYwQVdvC3XbuK1dY
 U56uLcoOqhNCAZQXB7G4q57Van1eWJxVmn84MX/3bkLtHhUjrI3skKJvSCe6GxJG
 J6QtRqyk2+zNKfiiFtbxde2/VogKVKxNl8uWJJq6fAPvEA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a20uea-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 02:05:28 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-87dfd03fb72so335372216d6.3
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 19:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761703527; x=1762308327;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oNYnTyhROEtSOeCA2ONPfk1zk2xXS0IqmDQAJE9y2I8=;
 b=dO2l4J03r7GgMxGoljUFldeRGPNZ+F/xb893DFxdBwbz37j05Jpdgi0ikxp6yp848B
 jbb2vKZSDy9S8Mp2zFnjWMqv+090o939A4Fy4ftTWjx13TfX5sLnq5JOfND2puawOrXj
 1uwv5zs7bLdMJ/8j2K3PWTUeLGKl13r6ZWyo1mNs+s2lXuvyurplHnTDICrYu43pBlXd
 RCPZYbEVuyykHxHy+Yrbgv39CSLmlFvi/H49lagT/4bk+CnTcKkAq3mLOevQRoEWeyTo
 eCGhxTh5cqAXr/k9hJu7+BeH1oKzWlMD/WGMMlrJM+riAguVX2bx8qx4YCxrYQw4SezY
 M6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761703527; x=1762308327;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oNYnTyhROEtSOeCA2ONPfk1zk2xXS0IqmDQAJE9y2I8=;
 b=tmIlaDIvctQY3eGyJbK7vmJD9rHbnyylNIcPzaLiMzMa2GGoVQ9LQiIjviFODNkXAM
 548OB4/WXw13R/Nm9Sonrem2ztQOeEnO6LWk4cQ2m365Z6WAmUza8h5Ijl6vlzIxfcTp
 3WiuecO5XTpS2wqEFxVqTD/nP7Q6LRHRwKHoUXncNnYG5xR15JOkrSXJ7QPaHbjWawgm
 vpRzYhpPwopvumyqEfk4i5+r7Ii2excz3UAOVIm0ME1h5MQ/cZK4H6W/LubON5M9PTT0
 ZpRsxlKawLt5KqEDDmYfyE+s/Wc1Lnk+vjqkTcoSdP66yPS3FAzUJ57HoTpLCqa3cWBk
 HTXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2MASS0S5t2i3z5y0u2GgPuChNH1kpxZBdBJfkZJMK9xGu3RWFgm8h6DrlpjZeHst8B/az7w0tOzM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5rXhwuCQbShhAEMihGyywFEUrtuKDp4G8fuEF6zpG5TmdyE/8
 97/gcRRAZjrKD2XELPGPSagnyq2qRnBFK3uz2wb+cEU1DNmMo+btSsyRA9VnAznTnBwe8QH9Ol4
 POv5uE+4TrzkT3y77p/REiTPc8Xc2GcUMKGxkv15c2OB+M/3d3XhXlT0pcMxEhaoZjAuP7rw=
X-Gm-Gg: ASbGnctOzWNNZPcv2qnNMXA676jXNclVoG4ekBBpc1iYU75gc/YaQVb6CxocqpMQ5WB
 3wWLM9lE0R53s7p3TZbIaxB9EIrM20RQPBi3utgYr5unQwphUYyn03Mo6cFNvouslJ/XSLAsDTu
 ses5Z8rdzSsYtenfdddhYrijJUKIXC/ZxI/0bseRZzeJN/hlZIUw1tB1RvomoWZo53BGtIdBJ34
 Opwkx6e+LPF0pyGjqty+OqzQclzxZaGdoRso9Mt9hcn4UCW3GAXrAJHtXd4rj/D/BwbyT5LhHvd
 Tqo/JIGxBe7M7wUCP47/cACrMfJYCsX00bYKNdIfGm1r7N5qJhd19cGIyfmknb+pFLSPz/eH+D+
 yXf/xpHMfl5PoeP0F8041ZqoH63bMNQYmi6KOI5jQYqRc+g7HerrxafNSLUtAh2Dk
X-Received: by 2002:a05:6214:1c47:b0:87d:c94a:17e1 with SMTP id
 6a1803df08f44-88009c08041mr17921646d6.48.1761703527390; 
 Tue, 28 Oct 2025 19:05:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGumAqyzy6p7G2g0/1nCG8Lfj49elpmE29lrS0JJixqIdFWH3Cdjr565IB/rUF7KuDDpYUNRA==
X-Received: by 2002:a05:6214:1c47:b0:87d:c94a:17e1 with SMTP id
 6a1803df08f44-88009c08041mr17921186d6.48.1761703526864; 
 Tue, 28 Oct 2025 19:05:26 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-87fc48a7467sm88752116d6.5.2025.10.28.19.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 19:05:26 -0700 (PDT)
Date: Wed, 29 Oct 2025 10:05:15 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Jessica Zhang <jesszhan0024@gmail.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 03/12] drm/msm/dpu: Compatible with Kaanapali interrupt
 register
Message-ID: <aQF2WwriXy2yFzkv@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-4-yuanjie.yang@oss.qualcomm.com>
 <a4a7f1c9-1817-4092-9ab1-07209bb44125@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4a7f1c9-1817-4092-9ab1-07209bb44125@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAxNCBTYWx0ZWRfX45uJmqg0wIMp
 nyVvW/Vx/o9beE6thqV91cvx0teFU/6Dqgw0Yuzoku/3BHnO0lTcWd4BILmmpZFIfc0POUavpMo
 HzjRNXQfaQO2+fGkvZRdZbyT5PN41trlzlR/V3sWoPuotMkalmg56t1V+2oJrYdj/9zKEp8tNOe
 fW5j5ep0lUJyl2izyoBHpAI1GgMTYXex8cfrf/I8ZcMgr3KC79qlzrgPl4tGFSMtn3thPfyqFRS
 wUCnqBFcGRYNjn3ucrdcuuiI5BC1KHOEy7vpdGkVf2cYBkRd6kMKa9ZoIOa1amGGZCeLFuGF6aS
 BCQ0zJulOKEYtzX851gApEtQ934FkpeotrsQZ6glruXr58mlk3djRF+Ai9Rz8iuDtQE/lnRkUv8
 ksnKnS2AF2A8vKFFruFFRM1+Lj+KHg==
X-Authority-Analysis: v=2.4 cv=V5ZwEOni c=1 sm=1 tr=0 ts=69017668 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=wkyyw-Wu4EUB7OuTH_AA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: XSOO7GFaPZ_EKyL73L48FIw9B-K2QUdG
X-Proofpoint-ORIG-GUID: XSOO7GFaPZ_EKyL73L48FIw9B-K2QUdG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510290014
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

On Mon, Oct 27, 2025 at 11:07:20PM -0700, Jessica Zhang wrote:
> On 10/23/2025 12:53 AM, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Hi Yuanjie,
> 
> Can you reword the commit message title to be more clear on what this patch
> *does*? "Compatible with Kaanapali interrupt register" is vague.
> 
> Something like "Add interrupt registers for DPU 13.x" is a complete sentence
> and makes it clear that you're adding interrupt registers.
>
Sure, will use "Add interrupt registers for DPU 13.x" for commit message.

Thanks,
Yuanjie
 
> Thanks,
> 
> Jessica Zhang
> 
> > 
> > DPU version 13 introduces changes to the interrupt register
> > layout. Update the driver to support these modifications for
> > proper interrupt handling.
> > 
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> >   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 89 ++++++++++++++++++-
> >   1 file changed, 88 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> > index 49bd77a755aa..8d265581f6ec 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> > @@ -40,6 +40,15 @@
> >   #define MDP_INTF_REV_7xxx_INTR_TEAR_STATUS(intf)	(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x004)
> >   #define MDP_INTF_REV_7xxx_INTR_TEAR_CLEAR(intf)		(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x008)
> > +#define MDP_INTF_REV_13xx_OFF(intf)			(0x18D000 + 0x1000 * (intf))
> > +#define MDP_INTF_REV_13xx_INTR_EN(intf)			(MDP_INTF_REV_13xx_OFF(intf) + 0x1c0)
> > +#define MDP_INTF_REV_13xx_INTR_STATUS(intf)		(MDP_INTF_REV_13xx_OFF(intf) + 0x1c4)
> > +#define MDP_INTF_REV_13xx_INTR_CLEAR(intf)		(MDP_INTF_REV_13xx_OFF(intf) + 0x1c8)
> > +#define MDP_INTF_REV_13xx_TEAR_OFF(intf)		(0x18D800 + 0x1000 * (intf))
> > +#define MDP_INTF_REV_13xx_INTR_TEAR_EN(intf)		(MDP_INTF_REV_13xx_TEAR_OFF(intf) + 0x000)
> > +#define MDP_INTF_REV_13xx_INTR_TEAR_STATUS(intf)	(MDP_INTF_REV_13xx_TEAR_OFF(intf) + 0x004)
> > +#define MDP_INTF_REV_13xx_INTR_TEAR_CLEAR(intf)		(MDP_INTF_REV_13xx_TEAR_OFF(intf) + 0x008)
> > +
> >   /**
> >    * struct dpu_intr_reg - array of DPU register sets
> >    * @clr_off:	offset to CLEAR reg
> > @@ -199,6 +208,82 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
> >   	},
> >   };
> > +/*
> > + * dpu_intr_set_13xx -  List of DPU interrupt registers for DPU >= 13.0
> > + */
> > +static const struct dpu_intr_reg dpu_intr_set_13xx[] = {
> > +	[MDP_SSPP_TOP0_INTR] = {
> > +		INTR_CLEAR,
> > +		INTR_EN,
> > +		INTR_STATUS
> > +	},
> > +	[MDP_SSPP_TOP0_INTR2] = {
> > +		INTR2_CLEAR,
> > +		INTR2_EN,
> > +		INTR2_STATUS
> > +	},
> > +	[MDP_SSPP_TOP0_HIST_INTR] = {
> > +		HIST_INTR_CLEAR,
> > +		HIST_INTR_EN,
> > +		HIST_INTR_STATUS
> > +	},
> > +	[MDP_INTF0_INTR] = {
> > +		MDP_INTF_REV_13xx_INTR_CLEAR(0),
> > +		MDP_INTF_REV_13xx_INTR_EN(0),
> > +		MDP_INTF_REV_13xx_INTR_STATUS(0)
> > +	},
> > +	[MDP_INTF1_INTR] = {
> > +		MDP_INTF_REV_13xx_INTR_CLEAR(1),
> > +		MDP_INTF_REV_13xx_INTR_EN(1),
> > +		MDP_INTF_REV_13xx_INTR_STATUS(1)
> > +	},
> > +	[MDP_INTF1_TEAR_INTR] = {
> > +		MDP_INTF_REV_13xx_INTR_TEAR_CLEAR(1),
> > +		MDP_INTF_REV_13xx_INTR_TEAR_EN(1),
> > +		MDP_INTF_REV_13xx_INTR_TEAR_STATUS(1)
> > +	},
> > +	[MDP_INTF2_INTR] = {
> > +		MDP_INTF_REV_13xx_INTR_CLEAR(2),
> > +		MDP_INTF_REV_13xx_INTR_EN(2),
> > +		MDP_INTF_REV_13xx_INTR_STATUS(2)
> > +	},
> > +	[MDP_INTF2_TEAR_INTR] = {
> > +		MDP_INTF_REV_13xx_INTR_TEAR_CLEAR(2),
> > +		MDP_INTF_REV_13xx_INTR_TEAR_EN(2),
> > +		MDP_INTF_REV_13xx_INTR_TEAR_STATUS(2)
> > +	},
> > +	[MDP_INTF3_INTR] = {
> > +		MDP_INTF_REV_13xx_INTR_CLEAR(3),
> > +		MDP_INTF_REV_13xx_INTR_EN(3),
> > +		MDP_INTF_REV_13xx_INTR_STATUS(3)
> > +	},
> > +	[MDP_INTF4_INTR] = {
> > +		MDP_INTF_REV_13xx_INTR_CLEAR(4),
> > +		MDP_INTF_REV_13xx_INTR_EN(4),
> > +		MDP_INTF_REV_13xx_INTR_STATUS(4)
> > +	},
> > +	[MDP_INTF5_INTR] = {
> > +		MDP_INTF_REV_13xx_INTR_CLEAR(5),
> > +		MDP_INTF_REV_13xx_INTR_EN(5),
> > +		MDP_INTF_REV_13xx_INTR_STATUS(5)
> > +	},
> > +	[MDP_INTF6_INTR] = {
> > +		MDP_INTF_REV_13xx_INTR_CLEAR(6),
> > +		MDP_INTF_REV_13xx_INTR_EN(6),
> > +		MDP_INTF_REV_13xx_INTR_STATUS(6)
> > +	},
> > +	[MDP_INTF7_INTR] = {
> > +		MDP_INTF_REV_13xx_INTR_CLEAR(7),
> > +		MDP_INTF_REV_13xx_INTR_EN(7),
> > +		MDP_INTF_REV_13xx_INTR_STATUS(7)
> > +	},
> > +	[MDP_INTF8_INTR] = {
> > +		MDP_INTF_REV_13xx_INTR_CLEAR(8),
> > +		MDP_INTF_REV_13xx_INTR_EN(8),
> > +		MDP_INTF_REV_13xx_INTR_STATUS(8)
> > +	},
> > +};
> > +
> >   #define DPU_IRQ_MASK(irq_idx)	(BIT(DPU_IRQ_BIT(irq_idx)))
> >   static inline bool dpu_core_irq_is_valid(unsigned int irq_idx)
> > @@ -507,7 +592,9 @@ struct dpu_hw_intr *dpu_hw_intr_init(struct drm_device *dev,
> >   	if (!intr)
> >   		return ERR_PTR(-ENOMEM);
> > -	if (m->mdss_ver->core_major_ver >= 7)
> > +	if (m->mdss_ver->core_major_ver >= 13)
> > +		intr->intr_set = dpu_intr_set_13xx;
> > +	else if (m->mdss_ver->core_major_ver >= 7)
> >   		intr->intr_set = dpu_intr_set_7xxx;
> >   	else
> >   		intr->intr_set = dpu_intr_set_legacy;
