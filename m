Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A99A7B1BF53
	for <lists+freedreno@lfdr.de>; Wed,  6 Aug 2025 05:33:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5030C10E71D;
	Wed,  6 Aug 2025 03:33:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XIDjR8lF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0225110E2E3
 for <freedreno@lists.freedesktop.org>; Wed,  6 Aug 2025 03:33:05 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5761el3a029100
 for <freedreno@lists.freedesktop.org>; Wed, 6 Aug 2025 03:33:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=E6ZxrCjqBVtepsO7mQAejcOr
 0b+KcgjVHvwf5asrNsQ=; b=XIDjR8lFhqErTT2U2/ak4Yt42dRDv7vBONTj+97u
 HsrGQ3g4IvW4ZSyI0r23vHX6ok1b67UEs45SnOuTSELlmLEGOJlIc/YMpqHcefsV
 u2z6FgrkxFmC2mdHwESRRX5LNZuZumSWaglAwCSUlYpqrUcMUupwSC/KHz8T2ObT
 6KY2xphjdwjuU6WI9mZBXW4h6Sn5lpuATBOa9WzHNPt0SvqSQqVG8/997ltZ/2ax
 KvYufXxdKxDZ45aZjaIyvBDUHSWB+udPrRWXM5pSrygQJTLJElmqi28jmxwuhDKu
 L6fGrpe+tIkbKAfQhSiUzW0ugDSw/uHyMAzDfWiSkG5DNw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw198sg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 06 Aug 2025 03:33:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4aedd0b5af9so95319971cf.0
 for <freedreno@lists.freedesktop.org>; Tue, 05 Aug 2025 20:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754451184; x=1755055984;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E6ZxrCjqBVtepsO7mQAejcOr0b+KcgjVHvwf5asrNsQ=;
 b=bECOtERbnaxnAIhVsXSVKKYqARdHPVGBdJPbxex3sC0ClZijr4rtuOUdY5pd2bwe4w
 GRfk9pYybjdh3aGniagmuVUnlxy7SkL5qkgR+oEIZyaHHrqyIj9bWVkKiNLMczY+5UBF
 0iTCnnkTZD1kSbMj0SE1SDJTto+t3I36jGCRnXDiRSU9mh6dza3DsLMqRN893oiA/tGN
 Zg5o9bg47OAMdtq+kgwS/NLsz+cvjTUb6n2A0mAt8iWBmIQ9qgJyAaoBELxtknWT6GWA
 BX8H59cUS5M8NTckIZOWOTvFnyOn5TwcvSHCYX6iL3+qBxnGgv0nQ/u/rUGuc/unyWmD
 s5sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsCVsJN4Wlf3QTY1TEUqf4zAgwaRvsV7FXvHGRWjE48kBdNo4B6JyCIJ54XZZtY1cjpW8gDLHpRmU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwolS2RPgjy2rgGXq+15crdUox7+T9+5Sn9IT5cGQkQRCu/EI1b
 RJAviSkLUTvLirPYsXpJj5a9X6KMfAASAWcOQFrE2M5uwYjN2aXV7JAkIcQAwt0bjfOYmgQ4GDc
 1Ltz0RaUHkwNWlRcITGEwkBhxuVcdUfAeVNJE7Iv3XaIKctJ6NRtzFCn8ngBBN639YEEIdEY=
X-Gm-Gg: ASbGncuF6CCp0fvAcfSLsSlyVpTDAODJ2trTxruS2b/O+oYaCfDSeBp1jw2WZewcTxL
 RqvMbwdsMOjZaarVbi9hhvXKsrT4U5mDnnQ980gwScnMub/p1nPrjuduNqdIq9MjKmWf64LeKM4
 9s0z+kOAJSi55JzNkJmocjpZAp8aYLitNS1aOfWYDI1WQ7bEKDY/Fq7mPAcXyOv8lZpgbiKHWRH
 iPN8Q3Sv1HzApZJ4GhVs71Mbdm0rRRBf8vSI/rv0mZS/FNpu/2InMOV9eIXOWu/V1luJeATapPC
 IN9Ft+awqKr3nNhWGj4yhEu37ofhFYDVl2vlxM3nt69C+Fwkn2w1pzEEB7znK7emngsL4EUT1+X
 R9eQO04zk4ozQo+e45zCGMVzEhAXnGOm5Nya3aj97j1iC1fWpcBpa
X-Received: by 2002:a05:622a:11d6:b0:4ae:cc29:82a2 with SMTP id
 d75a77b69052e-4b0916256a9mr15640351cf.59.1754451183438; 
 Tue, 05 Aug 2025 20:33:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIwhF9FkF6BS9ElI024cVRv19Q5ymyMG2vkjQdqC5u3HaOqDL9TDsvnsZAVpO/+YTwS4Uowg==
X-Received: by 2002:a05:622a:11d6:b0:4ae:cc29:82a2 with SMTP id
 d75a77b69052e-4b0916256a9mr15640001cf.59.1754451182812; 
 Tue, 05 Aug 2025 20:33:02 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8898bdaesm2164581e87.9.2025.08.05.20.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 20:33:02 -0700 (PDT)
Date: Wed, 6 Aug 2025 06:33:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
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
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 6/6] drm/msm/dp: Add DisplayPort controller for QCS8300
Message-ID: <akeglwafbtldzbqwudwsogrdw6zsxua7ohzkkjxqrw4d5uwhdt@fdbqudkqwpe3>
References: <20250806-mdssdt_qcs8300-v6-0-dbc17a8b86af@quicinc.com>
 <20250806-mdssdt_qcs8300-v6-6-dbc17a8b86af@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806-mdssdt_qcs8300-v6-6-dbc17a8b86af@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX6XuyvIL3HMW6
 iSp5WkYVIxjWftGzDVCKyumJwRXpfZpz3kOVZc/ZWQgTLd79b+Eant4j9bwEuDP9Igvfq+L/Knj
 ppCKsluKn4rC1jekMk50gPfz+Q4viW1iI1IWdktSoTaKmdTLElsSN2bfsgUnNP+pRZgmVBxci1c
 lMb6vE4C33X2JDPQEYMxfAhpkL8sOpJF3wXxWDVcn1EyFS8u88VhM53ghCYM5xHsmCvqHyWwks2
 dOQqwI1CVsyhuHA7KqbIendasyGWXVygOuIdzuF/w/ZwNTBT1paZ7yfYXGsyvYWQYywKbHrsIuA
 vI99Yz6mmJC8wxmJI3OYNV4oqitGP9sBQ6VoN+j4vtN/eNEEMw+V1965wNu4c6GoJn9vD4srksn
 xqetq75I
X-Authority-Analysis: v=2.4 cv=Ha4UTjE8 c=1 sm=1 tr=0 ts=6892ccf0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=2iKMfItpbZzF_GTDK0UA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: cJcPereneHlUuMxKqi05Wx4CcfW7zY4e
X-Proofpoint-GUID: cJcPereneHlUuMxKqi05Wx4CcfW7zY4e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009
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

On Wed, Aug 06, 2025 at 11:16:50AM +0800, Yongxing Mou wrote:
> The Qualcomm QCS8300 platform comes with one DisplayPort controller
> with same base offset as SM8650. But it requires new compatible string
> because QCS8300 controller supports 4 MST streams. 4 MST streams will
> be enabled as part of MST feature support. Currently, using SM8650 as
> fallback to enable SST on QCS8300.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
