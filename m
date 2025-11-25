Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D4FC8696D
	for <lists+freedreno@lfdr.de>; Tue, 25 Nov 2025 19:24:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A3510E411;
	Tue, 25 Nov 2025 18:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ur+eU95m";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J0oQdFd2";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD5E810E411
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 18:24:33 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5APB5N5w3255839
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 18:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=1W2pZNd5o2xExOvwqTzV3PfS
 MN7hG4UWUiuznKEkBfE=; b=Ur+eU95mifuE9XNyJ5XC7WWeigz1+ESiy9qAu9sy
 ONFXvdMcfN4wdL95ek/giXY4BoDdytPxVAeVXoLXgsr+3KtcaglkhyjGoNyQCRt5
 lSePbR6ngZa02QoE8T4nkY17GDwl6Y1LeC9RQT24Y+4EBzIFDdkZBcwK0vfQliDF
 B50F7iqkoLl3iA9Tpo97dljrWKuKJMmdPPODMYiEHBU6UF9K7uTur4YbcvM1GugE
 9RqBAf2ahpwMM1iqdrWn/QHDrP0elo8FtSTFKUCiOQC8KnUgQ0pGefbslkVwfLdb
 ggLwqCA5ncWK8uf1BdKzxXrUE7MWnWnLZluax7xBeaf57Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anb9c18xe-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 18:24:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-89eb8ee2a79so2806569485a.2
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 10:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764095072; x=1764699872;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1W2pZNd5o2xExOvwqTzV3PfSMN7hG4UWUiuznKEkBfE=;
 b=J0oQdFd2TPFkfrbYJlPvQfSRdl0a2/Kf+p3XkTidvTQX9H/yNhthiIZJJh4sCUg/XI
 Yew8c3vl6gaLlFS1p6uSjeYcV+AuSICDpgFEVM45AFKsh1S5xYce3ylkrFRx98QEDADE
 fKei90onYPHom/DQzrHvuKxODeE42yY4X+onXiwWSqk/DnvDbkVcJa9tuxy77ylcwEzN
 eH0IgYLjYxKsS3bR+n3uIugdi9l/FDbBC7JVb3Vw6bSqsQDQMQlGxb6Q1RCxm9WkmLyF
 oOYzktbe+3PpHPMsEny6FKJruyrcmJxjaXMXijXE48gaO5JDEoMiq/VTrlnxz9AC/+Xa
 gpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764095072; x=1764699872;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1W2pZNd5o2xExOvwqTzV3PfSMN7hG4UWUiuznKEkBfE=;
 b=I1VEDEPJSD3DhX/g7TdpJNsmVvmItWY85gpc6wzrKjreZlkoeOPR5JLQgniBLA6L9a
 GmA063fDVTWNfNjCr8ck+X1ROYUx8vwW9AJ/j9A2NWJKWFFY0g8OO4RCWGRtLlgQLslI
 GS9DueN9w6ul8RqE8h4mbe53B1OZDxSwtfhsJKl3vf16ct+P9DDj6t8SvWCFTwWNiI1E
 FE2gjwjDHctZkA9omPc+P+HLutJg9dzNquDl1HjIoK2f8E/66IpPXVOHTk6QLmTGV/ak
 Mby0jUh36XEwA4jV00tc/K2RqckTS2nXuzMF8tFFqUa3SdJsXEzOquec8zpMPDsE4mZF
 z4rA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiljUiMTqwjFrcWUI9Bn4fpG9qY4XYLdBsBuT0r0BxEtLfnOTeyRNNN8plWRJbTl6OaPli0XF70n0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqGRQFFi9HPv57Eej01uj2TIchpJrgPUYEfflkVIUh7MKzKweU
 8nAmXkcjpohQnegMcWIzDeAvPHnftRrRFfXUWgP+ndGqJHxCQfc1jTtv2087ikYRibPr2XJEzwJ
 ZX2aabK4wfkyFPcG7iRFjVoWL0oxu/BOIzW8nPexyyC/M3ySbynj83Z3tpprV2bLMblsP3zw=
X-Gm-Gg: ASbGncuxu92gXRBHx0Ee137ZiF+CkVXrNc7gY0vYp4bc4cSJ/U/a9x08Iy/rr/UkJ90
 oD7Cv95a/MdvuvNS9V1qgeUzQBM04xF920zL7cUdZ9Nei7Vo0Et5QSGgXVXK2GuIMOhv7utbYvp
 lbkM43l3HZllwnJpCFzZ4GnxMafd3LgsEJPFwNRFCWZdno+P2I7WoTr/g6rAbBklva8S6r0T51W
 uKKLqJozUo5+PuXAJLH/7+x2eIc9Q4e/A1D65Bc/4g0hrspE17FC8NyiMdUZJM3vze1kDftZlmX
 6uie5Vy2k6wsZ/HGuEQ8q1p4DMp1rVqcOmxBCxMP3AFefB1IvCwipBJE91IwFmTmAy0sSDSvaHM
 /HViYZX0yrNetcHgi7T7fVXtyKNuh4HY+/R4fAn5AFr5VYIn/EJlt6Mh9eiopIDV44F57JZpj4O
 WvnFDDnRKS
X-Received: by 2002:a05:620a:29d2:b0:891:a6b0:7cda with SMTP id
 af79cd13be357-8b33d5de395mr1943512785a.81.1764095072133; 
 Tue, 25 Nov 2025 10:24:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/LwsjMNs5hDAMrUk2thSQ409OAJVsMNAKG7KN5/TDjooNvMHnsCDt1A7pnyNx3Aq4GT59vA==
X-Received: by 2002:a05:620a:29d2:b0:891:a6b0:7cda with SMTP id
 af79cd13be357-8b33d5de395mr1943506585a.81.1764095071636; 
 Tue, 25 Nov 2025 10:24:31 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5969db74711sm5356013e87.12.2025.11.25.10.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Nov 2025 10:24:30 -0800 (PST)
Date: Tue, 25 Nov 2025 20:24:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
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
Subject: Re: [PATCH v2 10/10] drm/msm/dpu: Add support for Kaanapali DPU
Message-ID: <xf2v2idn64mbmnjofih76thot7iudiy5winekxwhki3snlqnd2@qaols2ykqgyd>
References: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
 <20251125064758.7207-11-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125064758.7207-11-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-GUID: jzT9l2-H6g745gKejWOd3pHpV8Z14SOf
X-Proofpoint-ORIG-GUID: jzT9l2-H6g745gKejWOd3pHpV8Z14SOf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE1MyBTYWx0ZWRfXwYUpfGhV1ATl
 4yo8OmkQt7FN59cxjNWi3And/r9oDFG7N3Nc8JZKEurx5h4OfITKqC6jZcu40GrY8dMxKKwQqyH
 8l1IPlmO7eTeOU6CJ2csfpyKVxH6RiXOgkD/+W5bTBoNbQ8JsSyIrgOuIWZNlDoM0oMjVJr1r29
 isegORhXfpvb3h11D8Fw9pP9ZAUvGNhBLHwqoQGMk7tULy/gA3/njdMGllyEhX37uPrsrrCpOk7
 MI7YbUWwQtY50u+AvAbZt82MwiZErtOlea+HBCe+uu8l8bO7wb/XZkXdq0uDpd/FVABqjS7FB09
 BoOexWj8m6yDzw1eWtojj9jM6coT8ek3kPzucVoZd1QpyJnRqbYYuWuPnUWGkY6bjJAvEL3XNX7
 LYBEmgLTjDHmp/w8vtXJNduPIn1L3A==
X-Authority-Analysis: v=2.4 cv=VKbQXtPX c=1 sm=1 tr=0 ts=6925f460 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=8hlrZ4-jp5Ul6jFpUz4A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250153
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

On Tue, Nov 25, 2025 at 02:47:58PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add support for Display Processing Unit (DPU) version 13.0
> on the Kaanapali platform. This version introduces changes
> to the SSPP sub-block structure. Add common block and rectangle
> blocks to accommodate these structural modifications for
> compatibility.
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  .../disp/dpu1/catalog/dpu_13_0_kaanapali.h    | 492 ++++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  41 ++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
>  4 files changed, 535 insertions(+)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
