Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FFAC5D90A
	for <lists+freedreno@lfdr.de>; Fri, 14 Nov 2025 15:26:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D8810EA8E;
	Fri, 14 Nov 2025 14:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QIYQGygv";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VNDQMq5z";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B1110EA8D
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:43 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AE8agTn1488258
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 g6rBuAvDgDvq4AbHe8l+9Pt7RcFzQYhXMqhsWOdMPD4=; b=QIYQGygvUIcBHrgT
 x2CsLyJcWPf5DnNtRFAz1YYZQ6UJMTqyakWcJgPNf7Lznyur0N0R8d2jReQSVJH7
 M6YoD1Ovj//zLdS6dQl531cNgeoyYlrjREd50di5XXA3wI4qqyA8FcKJFFvfheCT
 knQCF7GvYs0M0ZonPcFKOnxuSYPgCeUmhNWExhC/NJwCOsY2mDOOMbYzOtxM9PPw
 44Ua2iBAiYt9xXK65V1pQLaL1+HZlPf4n7XUhELEUXa4xtdOYlwpieOdgnzfSNvw
 1OwkeUYFs1sxaYd39rNaVKv32I1C9amw8w/5zI/2R+zm5QPCyA6nYpFb3o3Gnume
 BVAu1w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9hte94-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4edb35b1147so52959201cf.0
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 06:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763130402; x=1763735202;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g6rBuAvDgDvq4AbHe8l+9Pt7RcFzQYhXMqhsWOdMPD4=;
 b=VNDQMq5zTu1gR2mu2FqmtXM95ERyy+fWwkKB7piaVODElOP0PER3kzeqddQ9N1qsBW
 c0xDxo2FQVFLbockPcrY33CBEDxRF1FEl825aql3Byu8E0zXhjGyNHZMXIZRaUcRcPEA
 6rSJ2yzsDy24vqYbntYjYptmQIndISX5YoSwyyWQstQf5gyfK5p4Ztq6vfjxI3F0UfeE
 p9woEbeEmR+VQebSBXORjduPA7KVacGdnyi6r+egXV9xpFcXoKAR3Nh5PuaLaAROyFae
 F4loCZR22HUClNSK5T/SiH8o2dslyN/SbNC5VUOi5kU7XqP/9TMayK7fS3EKJHimBGsG
 YewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763130402; x=1763735202;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=g6rBuAvDgDvq4AbHe8l+9Pt7RcFzQYhXMqhsWOdMPD4=;
 b=nB5AqsNeA8KXgfG5NRiq5/ykqtD46EFQZM09IC7uT+Ayx61zVPRZp2Il4nb3D97SEK
 xA1dcD1H7YX0yi53ZUevMbUa7fWmhdtC4QmzI48LLQc8Ci/ZPnf6p9OSidFK1pA7zmgW
 V4LpbeP35gNVRIXNg/xMuWKAUocItWT6eP0/9kq3vZeLaRNLDS6ZNJ41LNMebEEMEu5H
 NJevL/+kT/KjLV/q+MWR+W1abFXX4PqYDGpRvNsfvMKrVlq3iFmFV2q4Qz2cE78yH0JI
 7zoRwyUhWWJPWyndIEqT8vXdQrY2Wj0glM+PRKlg1RYgANuL/fXWURBwOfoydG9trBIr
 PZPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNkrFOCw5qn8ICkctQ5z38MH77/gDDWWzP3ajJqdO5w59yAYz+LpozWIYKjvM7a+s8IRL+5VTqYKg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YweJOsUBE5nK/+86DLWTMYRZYYd5bH+syFAGEfJZLrWvE5eVNRI
 WbnwJ2PB6gHTqg5zXsWR1LxBz8MpIj9WyaDkSCZRsaa2s4OXv2WapNFgtZ9AgmU5kcWSKEHc8ns
 +KRW3idUYUyW0eZanxFMEAEeScirIqHVSmYxA2t9ANPCZ6Lc1jhrwlOyvwzMXpudWfyiytAA=
X-Gm-Gg: ASbGncvD4I/xmJR5u7/u0QYnyMeHIxZalvkrkro3Wug0IqPN8dZ4Nt0JBSuDgyeJ2PP
 36uvqA9fZsrrypja6VzUrAYozx/Il1xOyGOZoYT4CD9Ol1BxldxE0qORLJWThYb6f7K09m0kB4D
 W/DDyyQcKNnoSeTkWy6Gn17lyg45UlNK4P0tFhsOczxi+g0G0MPJGq44pdeIciZh0s1rCXImnmY
 wPa0rEA7YNy8vKopSAEsCyDMRh+d8bMlYrZSmP7ckDr5JlN++1yQAXEBXTpxQXeJTMm0032br1i
 c6TcuNTUW16NLEWG8p+2d7LIbIQb3EWbb/FWzdxSp1PAFD+AaU0sy592GgvUdYL1T4fWDdCUsLP
 Rk9ABF2hUI1NSdgDEGFUx9liTdoGHb6aX11l3ajAatDLr6iIHbtOhXGUFayfmFp+8wbAYSviXaN
 CP1fZ9sboUjG3y
X-Received: by 2002:a05:622a:38f:b0:4e8:846e:2d8b with SMTP id
 d75a77b69052e-4edf2068f59mr43986311cf.28.1763130401790; 
 Fri, 14 Nov 2025 06:26:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEakUAc6N2fCqGU4wm/QqwFYrmn+RwHY7Pqe7u0eTPXZmmoSH1fDCDFdg/tANn/M1o7MNtAow==
X-Received: by 2002:a05:622a:38f:b0:4e8:846e:2d8b with SMTP id
 d75a77b69052e-4edf2068f59mr43985831cf.28.1763130401240; 
 Fri, 14 Nov 2025 06:26:41 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37b9cee0cabsm10318821fa.40.2025.11.14.06.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 06:26:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
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
 Yongxing Mou <quic_yongmou@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/5] Display enablement changes for Qualcomm QCS8300
 platform
Date: Fri, 14 Nov 2025 16:26:32 +0200
Message-ID: <176312947279.1737000.15103747115099944303.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250730-mdssdt_qcs8300-v5-0-bc8ea35bbed6@quicinc.com>
References: <20250730-mdssdt_qcs8300-v5-0-bc8ea35bbed6@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: YKlWMPCqf_CwxReWhMqATWtg33gYYWwR
X-Proofpoint-ORIG-GUID: YKlWMPCqf_CwxReWhMqATWtg33gYYWwR
X-Authority-Analysis: v=2.4 cv=N+Qk1m9B c=1 sm=1 tr=0 ts=69173c22 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=2BC_VhOQHQuvYBtrr_oA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDExNiBTYWx0ZWRfX44othEMBA9W0
 N4tUs1s6j/7nZ4iKlFBPHidJeOk7dObzqm6c2dEAARDsuDAg6yG6UAPJTEzvNs6QbaYq0fB6pD/
 I5Weg1gwRp524XqVNNJYxDBOqXPkkILP1r5zGX3oGY9hs+8KQrETeME071SbbAQkbNHC8fwvhIK
 OGCgWx+Ulg8A0ahfPBYyDIfvwpbEhaO/+Yc60mwcmdXgZTplUVhxkME5vNbvHVv5TPBw7N/JKjD
 +ymW7Txv9nZWVn7FN0ug01O4duV40F11f15jF+10IuOU0NDHA0tFVg9ZS7s3qhyh5Y589sy8ArI
 QHbfQpN2Zkp97NVgjdtR275PbTipp7Y8pbApcG+UaSjQXC52ybigHuIrvhPJWnlP0Varb+Di4Nq
 rfjEDa/yU7wem3GzhLR39cRidrfPdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
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

On Wed, 30 Jul 2025 17:42:25 +0800, Yongxing Mou wrote:
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
[4/5] drm/msm: mdss: Add QCS8300 support
      https://gitlab.freedesktop.org/lumag/msm/-/commit/628fa5529762
[5/5] soc: qcom: ubwc: Add QCS8300 UBWC cfg
      (no commit info)

Best regards,
-- 
With best wishes
Dmitry


