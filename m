Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B55DEC5D91C
	for <lists+freedreno@lfdr.de>; Fri, 14 Nov 2025 15:26:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF1F10EA8B;
	Fri, 14 Nov 2025 14:26:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AkZ16XO/";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sy/w24UZ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5CF710EA8B
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:49 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AE83viq1494573
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 G52IQeprFzU/RViBvcTb3gUefzNosEjB48PU17kZOnk=; b=AkZ16XO/WeRB6wzl
 Wck8EnWVUMErhHhBVaTtMhfqXUDsg/ndHF6jIr+xpy+ovvdwiRi8jdCLcT+fcQwp
 0uLoXD0gYtlri5mQjBDqKxHi6ZHA9smLWSAoiPXLhFMynX5LizwChEMKf6bzaCoy
 MTF0sj8ThkPUNhO47xLF7sBZ6hLBZTcGZCsEtD6ccdbMpqFjTk9MbKXvB2eP9gI0
 rUM/gBrFVXX/47FUtd3OJG2nlhsBvLtrfbMlgkVHYx1Z+jPn6vkPr5QwFpwsvI0L
 a+y7HLcgM5D9RgzuJhJ/1WTbAdyWeYvg/UAiMZ8230RzvZ/Jo+anUSke5MuD8fLg
 uQ7Sxg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9dtdgv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4e8b33c1d8eso61075921cf.2
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 06:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763130408; x=1763735208;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G52IQeprFzU/RViBvcTb3gUefzNosEjB48PU17kZOnk=;
 b=Sy/w24UZ1FYAatF89YwkLT9HmLZOqA4ABH+/YDXFK2+9S0Loc4siYh8rIT29z6aYsB
 hHlwbfs2op8mi5zl5po31WZzuebXfNMis4E1mYKIxHHIs2OSv6qFDn9Ba1+RF5puFSqD
 L8bXH36n+KQp5yywg2W5yvZNzOsEM2jR8GxBR2szd5y6w1FvnjMWDheVczfZygXjQAwm
 GET1aVgbGMV3r9CoSXb76NZLecAGIh2vpAYXz4Q0xD7E/OORJ6Z1aFkLikLk2JK0afSz
 bXLEBiPp1xbTMxkq5doDevqw+o13guHX65tg0vzaDlgsKEBi1KrMPhkASNpFLW+Z0KST
 VA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763130408; x=1763735208;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=G52IQeprFzU/RViBvcTb3gUefzNosEjB48PU17kZOnk=;
 b=CZtFMsJhUoSJzQQt+WO5qBBsN2qnS12pqiBz2aOG/w5NPBmo1oW1nIwYN/8QaZTYWK
 VtyVoOpmMLqknVeeD+sgDGNIJ+02zViHFpQKVsa/kWkYKfdcD0pvoR7pA477DdMFdkjr
 5/4FE0+o6Nf1UeWwgjO3Ehtauj0MJP7gWA9mAZeuONkdp+1CoIhsy/iYOomCBaMdjSbr
 rphJCulE161O0TgT3WfBvtM2YVkTe2TuztX7wXEygG25aSqIGku7/FQSoPBw98Bn3Ui/
 HC4XcV2HtVmleZXRs8VN6ivtXmiH1FGhtKEpbrb2EhB6k1fnPcobF26EbY/xOkyCn2wt
 Pmww==
X-Forwarded-Encrypted: i=1;
 AJvYcCUS+CXCWRH1ANL1NX0RFuOpMaIXJs2srthP0+cOKWzwdfTunT/bFU7RaVj9EBa0GzG0fTG0WbOA+WA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzL0qCk5xhkfHWct/9Z3tTkoWITaBWutX4hp42W0AZr+AGSq2ev
 fRCgFUJGUzwb7JvJOK/kjitXiTyMkGKEJlvKgNgvTIHhrWjKjESVvCCL0BYXiMd3pqkCQH5VhVU
 u28kYtIrCBNP7XmY8DkjjhSLbeXFEFon0HRMUOw/uczFDCN0euRoLO/nQ2crodvejRkG4KDg=
X-Gm-Gg: ASbGncurEw9YhIgmEztlKbX/DOb6U8kS6RNuV1zznaFwXwkaH2UtevrEiw7nBWW81UC
 R7BO/1TwNccBV4BulvMfcTUlvVtmnE2mQ0MdAsJVZFz8tDwbHiLnERK5RYAiG/e7YNsQUPtijLR
 ZwRHD+rMAIPyReTtSMq7y61Le55q6ffGHCZbGvrN+3nnuVx9x6vIvyCKJhBO+gIlO8NwxcBYPT7
 Yx2686QqhUcOYZYEnNWLbWm+aEdYUZswpks9J8G4T+xbSjk/lcRwvZjwcrBcPbMHf5xM6zHWyBt
 9OG05tEgLhi14t13jL+GgaXlsz+9kXB0nAXKgkeBeQcMiAgqRHmae8FSJ/2GxsF7qEvDC+GpbIs
 Vwvr6O1i8PQja/yANf0UcGS+hKaFjgKM+RHevz99SNl8Nl16wjAh+eBP4XQw4ht07RbLjpgxsU8
 MeBAQfh+oDF+o2
X-Received: by 2002:ac8:5e0f:0:b0:4b2:9cdc:6d52 with SMTP id
 d75a77b69052e-4edf217896fmr49714561cf.71.1763130408103; 
 Fri, 14 Nov 2025 06:26:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwWp5aRHUEqmSsEDhgFAkvcm5lAcwhOsRY9giHZOk5pt805Ch7PaXZwR9iDf4LZA8XwoSLKA==
X-Received: by 2002:ac8:5e0f:0:b0:4b2:9cdc:6d52 with SMTP id
 d75a77b69052e-4edf217896fmr49713981cf.71.1763130407606; 
 Fri, 14 Nov 2025 06:26:47 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37b9cee0cabsm10318821fa.40.2025.11.14.06.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 06:26:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v13 0/5] Display enablement changes for Qualcomm QCS8300
 platform
Date: Fri, 14 Nov 2025 16:26:37 +0200
Message-ID: <176312947283.1737000.17850758513197921959.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251029-qcs8300_mdss-v13-0-e8c8c4f82da2@oss.qualcomm.com>
References: <20251029-qcs8300_mdss-v13-0-e8c8c4f82da2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IaiKmGqa c=1 sm=1 tr=0 ts=69173c28 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=2BC_VhOQHQuvYBtrr_oA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: sW5oCzRtx8CMTI-TCnH3snVpBDusX3j2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDExNiBTYWx0ZWRfX7eJrCg0+MMVL
 EcwZdxC3+ow1GIF9xGoyN0Bp+MjyZy+67kYd40ljsrLccI6qMKKG1T7D2jX+sFWu0sWVh4e7dEX
 HV3HCu2x9x+wZp05bS4ys5UEWuvnVFv1w0FKOcIic4qNhnEvBRNxJAvMb+5MVEMFWG+CBtrI/7j
 tH6ID4OiPeWbZCppBETtVsG39pe1KMKvjqmzKR7VecOmOvUnR0fOIuIfH43N2KCwHK7YSsvEBYT
 Cf54yu3FnofQ58VMjIIhIWr6Xlcxh4rEAzkIGOe+T/1PwAkmpSuPW9TgNKbF0pG6nTnKhjzW+Rc
 c608Y4NJiPaS5fQiOdVKdBMwfFdWfn7xeTxpUwT86UU0ZPMdiBVdAM0MKP630m2rNK2rz+RiG+q
 Fsg0bttsa9bTFI5MWsGN53ChojrygA==
X-Proofpoint-GUID: sW5oCzRtx8CMTI-TCnH3snVpBDusX3j2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140116
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

On Wed, 29 Oct 2025 16:51:33 +0800, Yongxing Mou wrote:
> This series introduces support to enable the Mobile Display Subsystem (MDSS)
> , Display Processing Unit (DPU), DisplayPort controller for the Qualcomm
> QCS8300 target. It includes the addition of the hardware catalog, compatible
> string, and their YAML bindings.
> 
> 

Applied to msm-next, thanks!

[1/5] dt-bindings: display/msm: Document the DPU for QCS8300
      https://gitlab.freedesktop.org/lumag/msm/-/commit/0e9cff574436
[2/5] dt-bindings: display/msm: dp-controller: document QCS8300 compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8a6c62490d77
[3/5] dt-bindings: display/msm: Document MDSS on QCS8300
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b420fbfdd62b
[4/5] soc: qcom: ubwc: Add QCS8300 UBWC cfg
      (no commit info)
[5/5] drm/msm: mdss: Add QCS8300 support
      https://gitlab.freedesktop.org/lumag/msm/-/commit/628fa5529762

Best regards,
-- 
With best wishes
Dmitry


