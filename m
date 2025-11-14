Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFEDC5D902
	for <lists+freedreno@lfdr.de>; Fri, 14 Nov 2025 15:26:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F36B10EA91;
	Fri, 14 Nov 2025 14:26:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lLlLy3pa";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hSSSB9Jl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4519610EA8D
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:42 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AE8T9qd1610301
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 N7lLyrVazxmxh0VMg9OnWGdTYdsEX1P3McdO903iSkk=; b=lLlLy3pa/0oPh88T
 N4IRDkueP0JPSpzFc9me6FoeuFZlhcIsd+18Wd+dx7kGs1cqozEehv3ikffFNdSv
 /PCa4oOZ0xoaXBo2+ICEqkuj1sXA1yto43G011Q8HBWEO9xUk65KdIiHxCtMpKAS
 2crrO7u9VAG1jF+WjIZpFfSQCDoSnLTU4w1ugHux7ifSOuaC74j75VCNXkw2GPqb
 +vrOdEPg1LcLDf8QAjgDkMCqEZovY4jZmltuvYhHN7oB8hRPLe2PaAUN0IkEVD9z
 DgO6lqyKjfxIen7Hmb5zpLkR5hGMebKZWWCvUXiKpqpLU9U5e+iD1PklZRL/u+Z3
 VPy4hw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9h2dwu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ed5f5a2948so48972661cf.2
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 06:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763130401; x=1763735201;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=N7lLyrVazxmxh0VMg9OnWGdTYdsEX1P3McdO903iSkk=;
 b=hSSSB9JljI07/jwanvstL/UFpkDs3C5LCoFfnDQODdUsCb7jS77BG7uTcYe+zlpt9E
 PpKIx4rKOlYZn2Hv00rZ7T/wz7fQxWHd7dTewq+x8PNrioLVP7N4aUfM4zo9VX/wkmXC
 w54nRraF6Drdb3q+w3fKE01oBmmrW9lZCJOzad4RK2Te62KlG+77NNtWes6lSVTzIhgt
 TmVxwMMxEKjdZ1EEcv1UPa0z/soGn6JUmsM1Ig+wdRVjaFdk7J1v05UIkokzqDgYC8k6
 BsT6SRB02adFX/U7iA4tuHCpcx3Bb3c0MWpsh1WJ+naNHdM3IdnYSVdBzEYFcecdcM/P
 6knw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763130401; x=1763735201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=N7lLyrVazxmxh0VMg9OnWGdTYdsEX1P3McdO903iSkk=;
 b=a7SEYB1aJVLyMOnDdqrMAGF4c5YzSPW5RgaUXdaY2mkpc45VYegpozbKnOii96ljs4
 KT+XUuy5tTjUHwyZSWQcPEFySCqZwJCeu9Jt6DeY+Hu1eS4cMXjRPAaekmUheyoxfb9X
 a5t3+VXxlZLzBGY9N/peq/tWAaEngTFkE7OEQUpCcOd0irosXsvM6Rzc9ZTnj+vfwIzp
 a0IwyCpnYhYNY+VoEGyFHDU1wrzDpf604Js0TyEnbNBd3/asFR2QPs7+yPE0aov/KJAB
 2mGhLcnJBW0i6iWylWaWBCNuqsizY4A5i7ynMJnsxZL45aXUAdmbCxZ8KmzkIVmtJDXp
 j0CA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVui3AGOKKPW0bPkZZUEh3sGiXl7tXko4PeHVDbFITU2/vj5BH1MgiUSwvy+stz6sz/NLK1tLS7wHg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzO6JVLT09BZW7iTfC47NtURb6zTzrkOxYfjFoSjvcGY8pk+kO0
 jbjnZQo8KmBTbRcL8WA/CNpmUaNqmCTdtQVLn5Yje+ytaEigW7pSxYMl1BMiwXagoEAnieMHHcN
 7a7fyFOPmB41Qu82CM2pZ7ceRWl090hUxVbUrtqiLb4Tn240zwDEQ/J9fYS1hXD1ykWTZTm0=
X-Gm-Gg: ASbGncujBMVTtDb7k3FdPNMxFZ3U/QRzomCReAuiQGEBO6VghbD/Yp0cV7ZKXWMuzN+
 kIvzBmruEl+1i59hintRTMRUZtiRrkmraK7f8rnXgQ7OHwPcrhe1KtjH6+t9H/Epz6rxst2o/aO
 oRg+v5MnAl8ajx3K+WEfsJPIunhXhQitATahf1+cCEU9yR4a7S8HcfSG+tDTvMNnudFA2rqXECn
 8ziDzTgJQEU0XK8V5Fd5Rxa7YoWJErCBrbzcJa8wTI/FL9/L39vAESXmUX5T66sSvqnfW//K4PE
 aVn7lpfIG13cr2uCjo0HB9hy4gcA/IIBKdq5BxSA1QtOz9J7exeCheDmklHaoIqLWUqJ9uhXM6/
 tOT6jiGGCjgr7Zx5TX0+yoBdLQYL1fw5++iVjr+vrfeXv9VVEac3X9NUrmxwmjojhBf0/KCUe+F
 3is3iogpz4X2kS
X-Received: by 2002:a05:622a:199c:b0:4ec:efdd:938e with SMTP id
 d75a77b69052e-4edf20480fcmr52130461cf.11.1763130400732; 
 Fri, 14 Nov 2025 06:26:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEbcH9zzsrqHSq4+dSl0dRGmoS3/QGOx/7GRhtG2RrVtk+FqMmOeboWeMMmkXnDPOqFtSlstQ==
X-Received: by 2002:a05:622a:199c:b0:4ec:efdd:938e with SMTP id
 d75a77b69052e-4edf20480fcmr52129901cf.11.1763130400126; 
 Fri, 14 Nov 2025 06:26:40 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37b9cee0cabsm10318821fa.40.2025.11.14.06.26.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 06:26:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: display/msm: Reference DAI schema for
 DAI properties
Date: Fri, 14 Nov 2025 16:26:31 +0200
Message-ID: <176312947285.1737000.12844638893324731858.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251021111050.28554-3-krzysztof.kozlowski@linaro.org>
References: <20251021111050.28554-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dpUEHV7Iz0nyfOITign_pE5BZ83qaF6I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDExNiBTYWx0ZWRfX9gPewUc8F2k8
 Ke7TGFOghD78cAtajJhN2CF+RX2UMmm1Km3iOQaq36JDieZWntinrgeTfk7voi20hHolNDwrhqo
 44LODSQqrRfqv0t+L5zDA2J2XXQ+bgVpC79nVjFmjraulYAjnC0vL40yXj7FFZn2HuUFXDowPDt
 Pr6vMmHZlF+jY4ZcGiGK/6kTHNALW5/uDiTJBemDzmmFem7bTyM0TESotQY4Nq6wTB7zK2TUOOp
 5a9BA2fgrhYPukvVpYqt0NwY64u84QxXWxSNWyxJUUiyRtiuhdSkRMoTYhHy7q7OeFXiE0aRASc
 zG/wdSaKvyRSldYHyxMe9UpLSXBsKUqbXNyeiSHAd+b7jHgsXORaR+HixyO+r+/9kCNwM2DcH2c
 fh0xn/5lK/RVcyYo4ua1CNiEJigm9Q==
X-Proofpoint-GUID: dpUEHV7Iz0nyfOITign_pE5BZ83qaF6I
X-Authority-Analysis: v=2.4 cv=V+1wEOni c=1 sm=1 tr=0 ts=69173c21 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=76GXk1XwVRG-H1p1aUoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
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

On Tue, 21 Oct 2025 13:10:51 +0200, Krzysztof Kozlowski wrote:
> DisplayPort nodes are DAIs (Digital Audio Interfaces): they have already
> 'sound-dai-cells'.  Reference the common DAI schema to bring common
> properties for them, which allows also customizing DAI name prefix.
> 
> 

Applied to msm-next, thanks!

[1/2] dt-bindings: display/msm: Reference DAI schema for DAI properties
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a4b9c1acf401
[2/2] arm64: dts: qcom: x1e78100-t14s: Add audio playback over DisplayPort
      (no commit info)

Best regards,
-- 
With best wishes
Dmitry


