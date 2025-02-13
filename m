Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA7FA34A00
	for <lists+freedreno@lfdr.de>; Thu, 13 Feb 2025 17:36:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA61D10EB1F;
	Thu, 13 Feb 2025 16:36:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JNg1ffw5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C63DA10E411
 for <freedreno@lists.freedesktop.org>; Thu, 13 Feb 2025 16:36:28 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DANLRv015721
 for <freedreno@lists.freedesktop.org>; Thu, 13 Feb 2025 16:36:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jRC9JvP4VHXNyNMipFwDuEvtSP6Ksiyg5e611bESZ68=; b=JNg1ffw54vq6vn0N
 HjZdNMLtyascFWWDAvd3gRaNKL6yhM86wZdWNJMFZ4VyfZ1vTnz+U+xJoHIR5hri
 o2pgpR9RMJjggd+7MRVjOJjEh0d/uB8G8hdGSFtXp8WBOBnwnpQi6aN1kLbbDl9v
 manfatZU67QSLS/+Fs6iATNYhdOwxuwEyHJe85BeOjGh68DT9w+VZdt+nhLIpW57
 hhehWoXSbW5VzVcpMykCpR5IT4EK2rGw16kkEsfTpdxfb/Ern9bZ3iW//bQ6K2j+
 TwHglL3QsTigQrmqHvWYuDfsofyDVsolNFTp9H4L8AB0dbl8sn50XFqxmM83OPSd
 j/WOgg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44rgpgnpg4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 13 Feb 2025 16:36:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-46e78a271d3so761131cf.3
 for <freedreno@lists.freedesktop.org>; Thu, 13 Feb 2025 08:36:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739464587; x=1740069387;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jRC9JvP4VHXNyNMipFwDuEvtSP6Ksiyg5e611bESZ68=;
 b=opq0lassFlitp0X5ZzTFJI7PnX/tyV9ICzswrvFjfzJ9tPbChxVZ49fNYJ4aqehlX+
 Y2+QzWNGIAgPugQJva7ACFP42zVZlOD8kzvs3te1t53YvsKB5jUlbR4rMsU6sLTTTWYz
 TQR3sRaEip/mb8VnOpTvB4YNnosMDt77aYn/fq1IGvk/WqTwKho2NH3P+nbaP8CL3aiq
 tICgGZYqERRZ+F87tjDKtKMrPAsh75UtTrooL9pSFnRJWUaIBMPb7nLR6HC7BDlecGRo
 DQGZ7ecUaLXPftQFLzghm+cQDLoZ/9F1dirrysZKM4zRCFb7WNbLaCIJaJgNQvrCDwqa
 RV/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeX2gMoSThXkXyTJ/2winQ8ZCx9SeD/PcXY9Jwo6TOBMCh8eyMa5LQxeaj/vn+6VdsLHSyw07a344=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywmo61bbhdnvoW96iblWvzrPQtceROaYFfQEMKnfbpFokC3KG3b
 PyDw09wkQzAXR4G8OKrm/x9XOoMprkk2BxNQcx+T51pJNAKG3rAbk7Fj4U2TzvCZ8MIHRCPkGQH
 mv0Bw/a0HbG018UcJpANFbDV68wvoxmBrZgeQG+1UcO7JKB2Cbn9hCYGK2KoArK/ZY3A=
X-Gm-Gg: ASbGncukB0Gh1KnOLRIixFBaW+stEBK2fnEa2SBslL1zF1ni7mw66QsXjcaV0IZBZTV
 6sb8wfLop6w2Iwx2MdXK52tsHKBPaAxavk84kn9lrZjzauZUtUNU9y0wRyos+LFouNo3GZqIxFM
 fvGPqJCbH6SVYx1xMbhweOgxV6ReB6gCxZ4usFyYVg2p44JffNdT+C5UngscIj949DqWgvo1XR4
 ZfOX3igt/IHLcGc7D4R5+4GfFJxUhR4ZTzhSc7DswRWrD1FQ+H5DHAEpGWcK5fatReWa4ev02j0
 b+HxIqSAnInG5zB0gHgafmdmlRmT9LNjLk+Va4mtbP5YjpTefMrvLbqJn2s=
X-Received: by 2002:a05:622a:1303:b0:467:5d34:aa84 with SMTP id
 d75a77b69052e-471afe57ae7mr39969121cf.9.1739464586938; 
 Thu, 13 Feb 2025 08:36:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE65B4BdI80A2hYuehypNi18VnhTOKeJzxy4QZub8Qv8xnIyZZrKkYGRhBtPZp8LP3QGhc+eA==
X-Received: by 2002:a05:622a:1303:b0:467:5d34:aa84 with SMTP id
 d75a77b69052e-471afe57ae7mr39968921cf.9.1739464586479; 
 Thu, 13 Feb 2025 08:36:26 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba5339d94asm161583966b.143.2025.02.13.08.36.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 08:36:26 -0800 (PST)
Message-ID: <2bfaa1ce-0233-456d-ba2e-5b14533f3812@oss.qualcomm.com>
Date: Thu, 13 Feb 2025 17:36:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/msm/a6xx: Fix gpucc register block for A621
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Caleb Connolly <caleb.connolly@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com>
 <20250213-a623-gpu-support-v1-1-993c65c39fd2@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250213-a623-gpu-support-v1-1-993c65c39fd2@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: i1g0gDYiOEgKicyHrZQJfYqB15py4hnS
X-Proofpoint-GUID: i1g0gDYiOEgKicyHrZQJfYqB15py4hnS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_07,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=850
 priorityscore=1501 mlxscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502130119
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

On 13.02.2025 5:10 PM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Adreno 621 has a different memory map for GPUCC block. So update
> a6xx_gpu_state code to dump the correct set of gpucc registers.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---

So GPU_CC is outside what we consider GPU register region upstream..

And I've heard voices (+Caleb) lately that we should get some clock register
dumping infrastructure..

So while I'm not against this patch fixing a bug, perhaps we can get rid of
dumping GPU_CC here in the near future

Konrad
