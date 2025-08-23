Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3528B32914
	for <lists+freedreno@lfdr.de>; Sat, 23 Aug 2025 16:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D53A10E1E4;
	Sat, 23 Aug 2025 14:21:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pCzJiM3i";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E81410E1E4
 for <freedreno@lists.freedesktop.org>; Sat, 23 Aug 2025 14:21:31 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57N4CwOX004223
 for <freedreno@lists.freedesktop.org>; Sat, 23 Aug 2025 14:21:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ECk1LsCNk3gjT6xoXSEgvWTIsSpYG9wG+965yN0jkes=; b=pCzJiM3iXeqj/lbN
 IV/J3mt6UntuZdlR3Ql5v+ass/KUy5aSHm8CbHFhBC9mm/jj2TVb32KpOIBEwYp5
 QlcmpyeDvvuKpxB/F4r8HH81zxGA3gblbiB+uWnoH9sFc2QA64XKxmEi0MoL0NH6
 lplW6K+gf5NrLnI18QZ4xKgXKem+MTryp9xjAhyuxJGjAU+Dkn+h1tTDP5s0N4A1
 baR5OUcMbcNmBL0qEN+OzZzSQ3uARnI2aDX/bAnMotkfRkNpicaP2oHj2QuC8Vw8
 ksopgrjb5AI7c4WgnaNjEXlPtzn8rr3rHdICw3NdEz5+xFBIaflKVOnzQzKfZ5XB
 4HMIjQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6de0x8g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 23 Aug 2025 14:21:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7e870317642so635293285a.0
 for <freedreno@lists.freedesktop.org>; Sat, 23 Aug 2025 07:21:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755958887; x=1756563687;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ECk1LsCNk3gjT6xoXSEgvWTIsSpYG9wG+965yN0jkes=;
 b=RTLna0c+5aslE+X0EzVSDwCTcSn/ckAtmAs4arp1nq/s2+YEiXofzm25ztvlkd+CPa
 OLQosVn6VF5yMomrQYvaJoeJjWjhJAGZKeD/zFFcY6FnrUTziYaBETltb83U2w8k35qZ
 f1h8Q1GP2wAIo+T4rPG/RJXBidKgTrUplzk1nfSvtPrYKKPtM01i1TGfiLB+kqwLgyHD
 IeKuvhiPYLtitdxFUbANZAZK/GewMU3xKYGnzk3rw4d/nFx/GHBE7TxmG5w72XO6yY5u
 jCWuPwUjGzqwLElA9XUexdFYiZk+Z58ilmrPt3ioCywO5qdbRLGVVFGu1dHI91xVpRQt
 Rbsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDnnzw4Z5IhT3M7KgFa23lRdm5wiorHGApjmBQcwJ+chjw42ntJkq9J75AVWH5O2QJH/mUUdCpAWw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCHYnvii4b7eJ7S85xIgRvCa0CJiYNOoRP90h3H6XOHVXHie9S
 Y7tvvcHcfMuTH34AwJ77DH6xw/67Yfc4heX7I+BK5dmIJV5uyaHTftfuWccoYNdoaAp6j6JWtr/
 WapamdqjaWikdBZeGU89WGF7Itf8mxMKe6VVUkpdBoFCXSHPHMySyWe65OWieUA1oTwpCODU=
X-Gm-Gg: ASbGncvqcnhBwVoXlWWArcVn6qoUaI9n4Q2WbmQ41yv9yzqh8luOQYpJCzYDEvZyGE4
 c/pivIAWHEWh+KIk2/wv6awZCrdblgvJL7BG/+X2SJHeiF3u5fiLEx524tf/lTOBlyKaeWRanmZ
 INSf+fVlUpd1Rm8+kyyrf5cFbuTAFhgQ4x9X387oqn7nLaZ48cIZsZlqMMzZEbWHwK9IndYvakn
 hkX8pH0VwmAKM2rxsIvquAuajrBZgNdaJU6bvPkMFjWFv1y78DPUFF+rSQu9xei/bKJ/P7tA9PO
 s2f/X3mOGjdrEzJU1AzwLjl0aloURWO/V7ys6AIU/66xdOXHiXIszv48kH542awl+39GPpLPmft
 VvNcNUPGk1NbwgqnOhNR5AiuKEDDpMI8vbgcVlIldJ8AccViJexBz
X-Received: by 2002:ac8:690d:0:b0:4b1:a3f:adde with SMTP id
 d75a77b69052e-4b2aaa40e39mr103546791cf.27.1755958887007; 
 Sat, 23 Aug 2025 07:21:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4PmkSmlgiF18xFq5d2W4o3JzzrwhL20Gh1Sspi04wdUKBR/io81yO2DxJF6sLkzYTQNqwZQ==
X-Received: by 2002:ac8:690d:0:b0:4b1:a3f:adde with SMTP id
 d75a77b69052e-4b2aaa40e39mr103546091cf.27.1755958886482; 
 Sat, 23 Aug 2025 07:21:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35c9a1efsm523398e87.118.2025.08.23.07.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Aug 2025 07:21:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Danct12 <danct12@disroot.org>
In-Reply-To: <20250823-msm-fix-gpuvm-init-v1-1-e199cd5b1983@oss.qualcomm.com>
References: <20250823-msm-fix-gpuvm-init-v1-1-e199cd5b1983@oss.qualcomm.com>
Subject: Re: [PATCH] drm/msm: fix msm_gem_vma_new() allocations for managed
 GPUVMs
Message-Id: <175595888536.1764874.11815793767108601921.b4-ty@oss.qualcomm.com>
Date: Sat, 23 Aug 2025 17:21:25 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNyBTYWx0ZWRfX5g4RXQeST+Xs
 407zipWYnU6yoCw43o2gncJzBIXBubEvJkPLJp8lpktsIL/DSwtCztWkfjrfw7VcbHYo40RJ27B
 XrLVD74eqRjI49nJillVE4NKo53u3lsr9n0UXwcaQoHNtmcyTOlgILbZlgihZ+Oe08Dba5p4RrG
 L4MBvKrMKPMbfy82Iulm1KYi/CAX59OlBsWrh2gz32BwLMro6A9pLxXfoBi2HRJURbPsEN6uMaY
 WZ3P/zHEL+RoSQfH2hPGTim96WPjmOPtngEJojvDONaIYKsO6aTVBCEYntKre9g+ao4qi8d+/AC
 ep/yaxvbSOL5Gj2COwNijEMcCvpOfwrk/G0O06s6JEl9hkQgjIYu7cpa09N8gRRNwvUQOdA5VzZ
 l5FuRAvO
X-Proofpoint-ORIG-GUID: SJ85n_lfnAJzp_H8ElYOZFGfBcDQlgKD
X-Proofpoint-GUID: SJ85n_lfnAJzp_H8ElYOZFGfBcDQlgKD
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=68a9ce6a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=yaBPxWdkq7d3F1QRnygA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-23_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230037
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

On Sat, 23 Aug 2025 03:12:00 +0300, Dmitry Baryshkov wrote:
> Since commit 3309323241fb ("drm/gpuvm: Kill drm_gpuva_init()") MSM
> driver fails to init, failing with "[drm:msm_gpu_init] *ERROR* could not
> allocate memptrs: -22" errors. The mentioned commit reworked the
> function, but didn't take into account that op_map is initialized at the
> top of the function, while ranges might change if GPUVM is managed by
> the kernel.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/1] drm/msm: fix msm_gem_vma_new() allocations for managed GPUVMs
      commit: efe927b9702643a1d80472664c2642f0304cb608

Best regards,
-- 
With best wishes
Dmitry


