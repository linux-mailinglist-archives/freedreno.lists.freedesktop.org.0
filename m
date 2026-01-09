Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6372D06F8E
	for <lists+freedreno@lfdr.de>; Fri, 09 Jan 2026 04:21:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2870910E7E8;
	Fri,  9 Jan 2026 03:21:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jFQgQyQQ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NjmWjCHb";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 268EC10E7E8
 for <freedreno@lists.freedesktop.org>; Fri,  9 Jan 2026 03:21:15 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 608Mp2GP3219359
 for <freedreno@lists.freedesktop.org>; Fri, 9 Jan 2026 03:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=l0S9oVoW17ZH7EHn9m++kxRL
 IL6UaU+sg4ZdoxU8wC8=; b=jFQgQyQQCec7pV7N38Bwd7g6+2p6h2fEE+scdPJ8
 /RH7R7HnMag3gKilpUHxoUL+zcO2AgI2HPOflOVc1DbesViVs/jgPOMZ7szOHkz1
 Wa41X2JNfK4ikoTD4p3lbEKF8tMUQG2sTHRjzl/pXoasPrjWdZjjPFN/0Vu3oGZ/
 v4yk95aLoKCbWhQ6r6ugYSw2tdsk058R4TyX1iqbD5DsMrRnpjGK/z/YMgRx7VUk
 ++q75AloMQPrr+lZ4KaWIKxfGqD2uyx5mKallexTQlKjRoSapmCRnxJEQN+MesvU
 pjavZRh2F3JWa4zSi9/G9NS1EfROa8aBQfhx+WfP0XSV1g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjjt0h0ds-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 09 Jan 2026 03:21:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b2dbd36752so975241685a.0
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jan 2026 19:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767928874; x=1768533674;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=l0S9oVoW17ZH7EHn9m++kxRLIL6UaU+sg4ZdoxU8wC8=;
 b=NjmWjCHbTuh+vfA2E8jka2Kwk/PT8A4iYGvbg0bHC0oY6ThY+cGb3RnJAAjO/UbPar
 K/UYQDfBt7t1U8IW+6yS/wmnhiCNp4HWHyRPKsJY33yTSmtpg6NF44Y0aQwEhrOd2bTL
 RVcaC2PV6sTDXhbpWXiTW7vB+cJxp++Rim4YTtYDScSN5HEFQnbD5xYnYzIDTbFKLJgH
 7K29BTY2DfiV9o/RvK7x27pNWJPgSwRtKZ3jV0pxVW+rzSbPIe9skRNqrx1rgB5Cmky2
 ndR3o4FESgbBd/Vh9ouzgtEEzqTsumOm++H5IfWeXjVDDXKJ5cfPiYA1mPfXn3x6lH5w
 stZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767928874; x=1768533674;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l0S9oVoW17ZH7EHn9m++kxRLIL6UaU+sg4ZdoxU8wC8=;
 b=UKvYZp+eRn9wmAPFeN3K+4O+qTfFIavqCoyE5zsj3ODHJ8SajhEOBUF3wt6ybuytm6
 EGaa6tpwmWXIfo9V8cePyyto5YfeVRKbTKUz7Izgb08U6z/KAopGD6AibduUxeeYjRdc
 +QWpDiRYc+p7IEKYsAOrG0lHLwBvDcWoUKiDPwIs9onmCGEeyD9Erg1HIPTd2SjmUcGp
 fkGkYaIIfV5p0yA6wJm3Q90gfCfOVFxwnnoMpqK/AGLh0vGbrUupR4PEVhCuC+WiwaeQ
 rCmBgjESI54N7cNJ3GjFRfEWDWwaFqVVdjKQc4JA5RX7Ln8HsCGTWbQVItHP4BF/jyS1
 Y8tQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGOqOA2vbq0V6FWqKRdwvMxr7Cu5MCPAHZwe93hQqEpEvx2Y+7Pm/PvyYiCqIk9gJVne+n4FGdqnI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKb7EWd6OvtAyd0SdPVwf7WKTz7hSGwedan35LR7jhNkQ6mLI9
 1yXccGe60mu8jwiAgwth1yP/pGZOeMC36hQQfmNNCkLU8y8Waex3dZOCsHNhL9dqbX32UMyzWa2
 RlleGG4cXo9wdE9Rr3OZWEbO8RY6bZDpqw3HreZOcbr560SmEeCrafiGpm2G2Ys7j8DqfAxg=
X-Gm-Gg: AY/fxX78omfOmSupmqvpIWHqoLnvaahfqaAGvp9K8CpM8D1BxnNkbqBgul//+NiYACj
 xYl8aadltmrdNBS1IRVY/yzDWDU/xiZ75t/GxtBptDxlI/fTg32M0fZcYNxY015jEIQVQZdsCb4
 JFimujNDJI4zgFMq84L8WKAXGnsXnJoAuKiV1gCl/iBWmpJPJiK2ya9nJko1qPqBkm4Ka06v/vS
 wn+vHeIvu9UmKe2IyLFonha3Vl24fVqRqyqhQgcQTqQo11vf+J5EsJvqSaAHzFfj1tqXc1Wdqjx
 TlDobyIxpsW21mqZvKKobMMOJyCQEupw/BzsWc2XQWzbytf2nLwveh/Z19BC1GivLLMBuH/ZYzD
 M4NjiVfDkRD94HfnljkT5xMxXVmyg88xJbqkj2DwQePiw2wzuK+U/WrjeTlE+Rulu/7+PoHwciA
 fcd1iEngDsfVNtY1KbQ0M9GXM=
X-Received: by 2002:a05:620a:269a:b0:8a4:6ac1:aeb with SMTP id
 af79cd13be357-8c38940dd62mr1175659385a.74.1767928874410; 
 Thu, 08 Jan 2026 19:21:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7544jDNijz3Oqai5ryzQM1LZ2uw6kV2IuP26zDDOOLBfIgypo+Dzcw8kzTONbK6QX+Jn/2w==
X-Received: by 2002:a05:620a:269a:b0:8a4:6ac1:aeb with SMTP id
 af79cd13be357-8c38940dd62mr1175657085a.74.1767928873942; 
 Thu, 08 Jan 2026 19:21:13 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-382eb7a5c1dsm20225721fa.16.2026.01.08.19.21.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 19:21:13 -0800 (PST)
Date: Fri, 9 Jan 2026 05:21:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] soc: qcom: ubwc: Get HBB from SMEM
Message-ID: <hunbpvbfkcxzbnwr676z6fncgdhfumjedx7jp5izojusg3rj7f@5te77lmqcdaa>
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <20260108-topic-smem_dramc-v3-2-6b64df58a017@oss.qualcomm.com>
 <you4xijwc5g4ngcnhxm4ecn7opexnsdfayvd5wiiqpl7734r7w@bdkpjqmlzxre>
 <b2pqfrs2ptaoxxeanzumxyibmydsoiqslcsg6yrm4hihynowj4@mzazqnrptnyf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2pqfrs2ptaoxxeanzumxyibmydsoiqslcsg6yrm4hihynowj4@mzazqnrptnyf>
X-Proofpoint-GUID: jaTTnDgxVTSetLW7w1D2C1YT6qkTsprK
X-Authority-Analysis: v=2.4 cv=VJzQXtPX c=1 sm=1 tr=0 ts=6960742b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ZmktGZHw0soJo7N84tMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: jaTTnDgxVTSetLW7w1D2C1YT6qkTsprK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDAyMSBTYWx0ZWRfX8JflHBZrnv8F
 +Qx9DOx6K3EZslfRqp73xm65/47t8WHxSqRTkedKj+b8Pl3Pu7YaBbOsfDTeo7eYiJf/HpgACPV
 /vl0B/ED0bjlEdbh3IgXdmDWTRbvEnsvEU7T2n6I1+f7Foa7voML2bnzGuYPrJVxAUV7qBzIZcq
 eP9a5EA5bRtXeFTbbUuEyM/B4l9v+Hj2Lha2dTzY3BcFKDJS32M5CTOCi8ZqWe8GJtzMsWyPcxo
 06UaYfb7gC1VI738uKlc+ou8raWPqqVKcm5LOdmT3o4m2qg39SzBP27MWaO1n1++r9FketLADfV
 5ucCcNnlfldzoWvfd9mKZDVqsM9d2/EhXV7WVNT76EwuozcrFopNNgCJdbj7RAaAgvpZAFFrrp+
 t/9K43SBKRAfDYZ0Vig+wbCKDvaLqMSW0t6UTmJRYngBOASP+zyFuuq++L3eMG+XuJpmajRgrXU
 JrIwlhujZDI35AnG6AA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_01,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090021
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

On Thu, Jan 08, 2026 at 11:49:54AM -0600, Bjorn Andersson wrote:
> On Thu, Jan 08, 2026 at 04:45:49PM +0200, Dmitry Baryshkov wrote:
> > On Thu, Jan 08, 2026 at 03:21:51PM +0100, Konrad Dybcio wrote:
> > > From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > 
> > > To make sure the correct settings for a given DRAM configuration get
> > > applied, attempt to retrieve that data from SMEM (which happens to be
> > > what the BSP kernel does, albeit with through convoluted means of the
> > > bootloader altering the DT with this data).
> > > 
> > > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > 
> > > ---
> > > I'm not sure about this approach - perhaps a global variable storing
> > > the selected config, which would then be non-const would be better?
> > 
> > I'd prefer if const data was const, split HBB to a separate API.
> > 
> 
> I agree, but I'd prefer to avoid a separate API for it.
> 
> Instead I'd like to either return the struct by value (after updating
> the hbb), but we then loose the ability to return errors, or by changing
> the signature to:
> 
> int qcom_ubwc_config_get_data(struct qcom_ubwc_cfg_data *data)
> 
> This costs us an additional 16 bytes in each client (as the pointer is
> replaced with the data), but I think it's a cleaner API.

What about:

const struct qcom_ubwc_cfg_data qcom_ubwc_config_get_data(u32 *hbb)

I really want to keep the data as const and, as important, use it as a
const pointer.

> 
> Regards,
> Bjorn

-- 
With best wishes
Dmitry
