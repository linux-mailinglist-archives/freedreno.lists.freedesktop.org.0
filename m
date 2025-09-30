Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B79BABBDB
	for <lists+freedreno@lfdr.de>; Tue, 30 Sep 2025 09:05:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 544AE10E501;
	Tue, 30 Sep 2025 07:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iTnzXzJC";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3222210E501
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 07:05:49 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HlFD009631
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 07:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=YkcyM04R0DD+Qr3GHQ8OUnac
 Su7NvjdL0Knj9f30K/M=; b=iTnzXzJCCeI4G/IXM3iCA+u1U+kUCgpTbDDW0j9i
 SJOj5h9+3BBYuyoaVL1NretVK72heIAARIz51/FwbeZ/ZuAPpsj7EtkDeSN2FN8K
 ovbqZYPQ1C2V16I6gZ8kPRaiCcSe7qdWBCr2bXXVcT+iMfYP5zbLA2kgKoqzfJdg
 Qg0jmvNIqTjE/pAjEB6xZBHOndn8L0Zv3F9m7dx79YQ6K2mDJGNZTZa+AXRhD9zw
 r0EHNJ8bJvzKGyIi40foXUD4B1EdWSQHU+xSs0DSFqziVw6HE15k+h4DPaoe8x4u
 lVP2BKMTF34+zeRtgF3xcOCeEdvj+uEGgeyUv5DljuYhTg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e977qrq2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 07:05:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4de2c597a6eso129902291cf.1
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 00:05:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759215947; x=1759820747;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YkcyM04R0DD+Qr3GHQ8OUnacSu7NvjdL0Knj9f30K/M=;
 b=xAlCSgTVhyFubYjsrj8DhRyOb8gOvloVa9W28F5n+GyLhWiBHC/jVApMwoM8FlR3v9
 SYnLX/NEyw8lL3E980Jl52ygepFTmRJePV0ncqY3Rrd02xrYZB4xoxXz7EG2OVL2/0Ko
 Wcjorx2TCKQ96kCz7b15KuVWqCj5uxI4Rt+rOuIPr6dFYri3D71973aTZdHkzRuY7As4
 R0X/PxGDuIXLjsJV9ECL6Lk8yNReQCnVzNpUkQeklNkYVsDoHCo9i3If7dEVis2G/VpR
 Kda7m67MWeqpoykEjpOnG63xRWf/c1L1Uuf7GZtkvkGCP5sPHnnNrEB7o/8zvxsmOK3U
 weqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQqbM/FDoUtX5WlbWGln1d7CdikVo4x53gcL4C990Lhcos48ZJ9OYxE4TH4yzEG9tziwQeN7/Qh98=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnkxBpZkA+JlRffbLuW6mjyLywxQD24uC3fNA89yuuU7FgPx16
 3dQMfScQBORdM/v9U+qvTAWLk0USGVdbAqQ//ot/qe5M+rhWQS/eH1uzAbwBU+9yWeaRXO7iA+i
 zzIbOHQy/DYqGWlPLyzYpwX2nr0l+K0GyEWfp8LWAka2Xjn4pyV+ywNHKzKWdgWnd7eZw/2o=
X-Gm-Gg: ASbGncssAhfe1Ij/Zr3eImH/WuhonW7bB7ll0BYtftCrLLkYvOL3MLhRWV9Psi250Bv
 fPyjOXwv7XyM/XLSQgvaZ24gchQHMgOxL+qvadslVfQoFCwKFOMAgzrJSPQVq2rwXoYgtWTSwKo
 3t4OzHrtZcFpdnXvy3ZRhdm3BpMcOYOyO8VA/C40rDoofzpWrYmdPl2OUcSnF/G0ojXvGEeOSCx
 SGrZI4YA+V4pRBkkVSDqg11/7Bis9D6HiYz+wnDmTwq14F0C5dpCwv3JTbLX+4+SL41XugwmjVT
 F4wdHNUNt0RppQKVSO70aEoMOtclkE2o2axj/BcHSl76ctYxHs1xw6/JOXOXl0SnK5JiQeGeTWw
 LCtK+0JFdinzyAfLF2qXeO8xPh2Yk9ht2C/RNSgYIaFXnhmFBbOOmfzM1Qg==
X-Received: by 2002:ac8:7602:0:b0:4dc:d94f:d13f with SMTP id
 d75a77b69052e-4dcd94fd62cmr145860441cf.72.1759215947153; 
 Tue, 30 Sep 2025 00:05:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6np5FgFR3yiAoIV4w+0+a5+/kCzcX9eD5vqs8OqsXllqsDXGgjrxwAtZPkSL/3P7NcRUnlQ==
X-Received: by 2002:ac8:7602:0:b0:4dc:d94f:d13f with SMTP id
 d75a77b69052e-4dcd94fd62cmr145860071cf.72.1759215946624; 
 Tue, 30 Sep 2025 00:05:46 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-587748b15d2sm1648013e87.7.2025.09.30.00.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 00:05:45 -0700 (PDT)
Date: Tue, 30 Sep 2025 10:05:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 03/17] drm/msm/adreno: Common-ize PIPE definitions
Message-ID: <xsgnpvswvkyuxiviv4uyb6pxbpi646fut6dy54kpyfisqrxycz@tyfox3zdi26e>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-3-73530b0700ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-kaana-gpu-support-v1-3-73530b0700ed@oss.qualcomm.com>
X-Proofpoint-GUID: ROnPBKj8EgIqKSYK_StcbFVOAWEpWkJS
X-Proofpoint-ORIG-GUID: ROnPBKj8EgIqKSYK_StcbFVOAWEpWkJS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MyBTYWx0ZWRfX/anjiVnItvLU
 kwUGnh1gzM9Mjzsongd3wedfYshSXHfQVVAbaJBCgfAEYgL1MdL7SdP2XcNjm8z5E+4kIYL1exQ
 acIuAObKey2og2dgv2DvrjoT/h9bSKtGo8YcR7b1YVa4RF4FvA1bI43AfRZue1RYXUfSCCgohbR
 oHGxNYigWwPc/LQHurKqinnBBLf8M4e271Ebmi7UV6iEQ3rZ03geaI5ywVTR7ZP2xtmDD5RsPCg
 ++UWs9LEdV+pkVp+irMG8eLCmujGIRx/Du/CqAFgXslQaO9VBV7p32xVxbWKDQiFSzm8h5A1And
 CgbPYpF6lTdiVVOSiXeI3ImIWzMtauUli2KRuKeFh6nOgGuX5wgbnEQrw7xpROh5KwLEEFVMHc7
 roAZFge6BKKOs9HIBcYW0eCvmg4XVQ==
X-Authority-Analysis: v=2.4 cv=Sf36t/Ru c=1 sm=1 tr=0 ts=68db814c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=ffTnwjXrKXMzwz1Z5d8A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270043
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

On Tue, Sep 30, 2025 at 11:18:08AM +0530, Akhil P Oommen wrote:
> PIPE enum definitions are backward compatible. So move its definition
> to adreno_common.xml.

What do you mean here by 'backward compatible'. Are they going to be
used on a6xx? a5xx? If not, then why do we need to move them?

> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |  10 +-
>  .../gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h  | 412 +++++++++---------
>  .../gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h  | 324 +++++++--------
>  .../gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h  | 462 ++++++++++-----------
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   4 +-
>  .../gpu/drm/msm/registers/adreno/a7xx_enums.xml    |   7 -
>  .../gpu/drm/msm/registers/adreno/adreno_common.xml |  11 +
>  7 files changed, 617 insertions(+), 613 deletions(-)
> 

-- 
With best wishes
Dmitry
