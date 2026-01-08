Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6700ED0378A
	for <lists+freedreno@lfdr.de>; Thu, 08 Jan 2026 15:47:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E2AF10E759;
	Thu,  8 Jan 2026 14:47:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kJD08MEM";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bBLX05Yp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA5A10E755
 for <freedreno@lists.freedesktop.org>; Thu,  8 Jan 2026 14:47:04 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 608BP0re3751449
 for <freedreno@lists.freedesktop.org>; Thu, 8 Jan 2026 14:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=E05euwxAEaPxLzxhkVp86rla
 Fr3gpWYqRJx6YmxUvFY=; b=kJD08MEMU3oCMp/3slFjqu7ezHmKWErinn/XqRgi
 0q9pYByq/0orhd+I/qyFuE3H1hh/bbNBW9vL/2UruGtjD6rgQY9Q6u0KmPDpk6Ac
 QWgN7rN0sHPRkO1omlyAnjifkCRpDac5JKDE1LCTS23jpgeBG/VwLjKpl+GO3klO
 GUHknwAENLc8HD8WPOP7Q8CPeDR/vOqIDq0kunl16GTRV5qiDiqoVCr/cxZ6jtDm
 OPIK3JacwO+cR/biYvoa9dDY61WJNAalsUFvyzIeVnhh1bgeNuogfar/+ttv0aZk
 1ok28kt2jwyQGKeK1HCABvba2NloJk9Y23MYJNJ6v0LKuQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhuxcukuf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jan 2026 14:47:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c38129a433so798218785a.2
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jan 2026 06:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767883622; x=1768488422;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=E05euwxAEaPxLzxhkVp86rlaFr3gpWYqRJx6YmxUvFY=;
 b=bBLX05Yp5KzNn+0Nt3lJkoTXaqn4OF6kDeULUq8Zj4+5PCIhgGh9B2OLbx59k5uHz/
 fp0jeuSZTZT6f4FF6a+31DUxCZJX9eWRtYMpMNdp/0QGi4lh/vXCUbY61e9wuBpc4IiM
 2F5+9tNXyehp/7m2/FIEnfF6Eu+0E2Mw41GDsoP3iagVOS9NCmesLgmUdASQ9fSh5cMH
 JXj0QpzdDOFNDzI2CwMqexHGwvXLIWYXSbEp2E9LmlrocYg6KpUIgUJu59bL3FeiSBjL
 zd7Jx8xsT7oYHM61u0VlSBtaSwqFeDhk0M88ehVFC8/ypxpDWnkTEYjNEQywARFil7sn
 5YPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767883622; x=1768488422;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E05euwxAEaPxLzxhkVp86rlaFr3gpWYqRJx6YmxUvFY=;
 b=KEQRX/nIXnRdL4kFfIpPR5jAm4nECjs6M3bAeyORzfdEAdGG5ONLGq0hTm27E/e/MG
 bJX/fuO3xSe8K+1HJExDZAFKleuIIEqDVqbqs5aIGiwS/G7jkwZuBqa6xmC1z/a2mpqa
 4g9ABV7YjX58LCsclDgz4l/yOWqerhg8LfDvkN7ae37DEBvwLYHIDNdNPrdwsyrhBB5m
 z3BRtExJvDdrYSu2DFDVuhUny8DwquttSf02LbkVDKlI4SmTSwJOqKukfhKgB0CWCitB
 APoQHE4Z4QM2BR40w2T4TSh3HCqb1jHzCjmC55kBoh8YUaEQp5AGSPdEnbO6fGgULPcm
 Cmrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjTIh+ysLUNnAVbavfxemHD//D/Zfac1ztw0Ejm5nKj1Ms1BpzY41iw4DSLWLliSQT3HRVMkqahf0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRbZG4RLWpZwwnJlOdSK5gpMj67p+lbk/E6gQZ0KvbPUxh0/xe
 WLzJkAUmZ/KVsmuAjRumiXwWtVPyjPcxj/rC8Opuc/UNxNt7xuV6ZddwA35a4W5ubxugg10k7h7
 PVmbyPZhrwvGQ5xLkavbGz78AlWrbnmmqC1fkzWAT1BJsDlRH3AZdv3N5tglK+zAmKEr1wi0=
X-Gm-Gg: AY/fxX5jlAKQB2F1j8jcLi80WArlmaBg7ig0HW3rYAfomUVmBi3oCnyy5jcNmjsU3FJ
 jvn3Mm9OQx7MSPIci+YrT3ojSDS+NgD+9OlGtKQ6/klvTUz8id1EBd1iuLUB0U8dSDcFq1Jg980
 3+osdw6ZtWYx3mwuMNYTTd8ghef9fwMK9wkzM2LsWjvYQVB4RFSv8IxSsWlULMogzC2B3tW2B2B
 N6b0o64vadStlg0vhbFLCAQaTuRS8Ovm3zm9GJs/4DO4xta6UX3hVN9KKTduHucg2+Ripd8RC3n
 pa08jy1NifrysaA9K5w2uDViiRfN1hZ4QAEL4LbNUGaUeD3EzdvpdM15wpJS4igv889Nu00+XfL
 zdHVsAcRPNR3/YLw4UD8dQuihF5v07KiscdnTfXGvc0YPInxjhaTHOR6+GJ8VtwbfGPKjXhiRGX
 HDbgj6p+p+qRfLx/a4W00WAJA=
X-Received: by 2002:a05:620a:7088:b0:8b2:e4f7:bfc3 with SMTP id
 af79cd13be357-8c3893ef8f2mr824071785a.55.1767883622332; 
 Thu, 08 Jan 2026 06:47:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZdKHI6y1PJg4kw3AOKfreiD9CPsGiS2albZ66Zp0/O0JjiGxU4Fura7f1B/vNXX4L1WRSNg==
X-Received: by 2002:a05:620a:7088:b0:8b2:e4f7:bfc3 with SMTP id
 af79cd13be357-8c3893ef8f2mr824066785a.55.1767883621894; 
 Thu, 08 Jan 2026 06:47:01 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-382fd34bc69sm10292881fa.19.2026.01.08.06.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 06:47:01 -0800 (PST)
Date: Thu, 8 Jan 2026 16:46:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
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
Subject: Re: [PATCH v3 3/3] drm/msm/adreno: Trust the SSoT UBWC config
Message-ID: <65qhwotmxkxoa434qxtiflkb77espumpnacrw4nymvf37ozhcg@d6ouxfisuylv>
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <20260108-topic-smem_dramc-v3-3-6b64df58a017@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-topic-smem_dramc-v3-3-6b64df58a017@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDEwNiBTYWx0ZWRfX5aqBYMpAscFA
 +bY86Y6mrzBKyZupmnNJSzvZpvuM1v2C7fRNoy695NBpK6YyndmC1czoGy4wQ+onGyzdLR8pa5I
 7/UW/M6560Ip+2ku/R+6Z3NwspU/SOGZPQ5z2zucTL3JK+k/KYSIXNWiAS2xQVFSmXi6Cl+QeeS
 tI93TeDKAqsUp2rTd7B1t/IW6Cdyezq9q/TjNFQWK+GMyCEHlTPJ8k0Enm1me3vIDe+uRk2H5U9
 N+fU/dA6HadBGJWLteDbDhdTAlrHHrkXDW6ZTU4ISO8tlANQ5UVY+JAaUG5R9Akac3YvPIu0rGT
 XiX+JW7CwR/kK3aKbOLgUDZFo3ZJRO70qcQSTt4f9Lk0HrqcLHlrb84ybmn+jLT4SYAiWsd3Hi3
 p0CwPdYWmff4I2hFXwhJJsjOTXjZdRCdVgv5nJYga4YA8gIBAU3eJaUKJXQefmkFDDbRA5tx3EY
 ETwc1FqyKi7RHx1MJUw==
X-Proofpoint-ORIG-GUID: UaNfnkgTHuPsgni7xl7bfr21rJbtz4uS
X-Authority-Analysis: v=2.4 cv=SPdPlevH c=1 sm=1 tr=0 ts=695fc367 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3LDqQxKG0DOzahDZ0EMA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: UaNfnkgTHuPsgni7xl7bfr21rJbtz4uS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080106
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

On Thu, Jan 08, 2026 at 03:21:52PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Now that the highest_bank_bit value is retrieved from the running
> system and the global config has been part of the tree for a couple
> of releases, there is no reason to keep any hardcoded values inside
> the GPU driver.
> 
> Get rid of them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 11 ++---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 82 ++-------------------------------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  5 --
>  3 files changed, 6 insertions(+), 92 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
