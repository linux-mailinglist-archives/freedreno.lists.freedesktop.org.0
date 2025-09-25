Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B47FBA1B52
	for <lists+freedreno@lfdr.de>; Thu, 25 Sep 2025 23:57:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A4C10E9BB;
	Thu, 25 Sep 2025 21:57:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XK1uqDAP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 755E610E9BA
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 21:57:28 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIQ56L025161
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 21:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=0PwCuPQqx8Z6h5Uvt2HeerM1
 J/nGXO3zl9oVlZVDBoc=; b=XK1uqDAPXweKnTZKlUOckWMutVJlu5JD471YAHDp
 y/fSOf6S0JmkK4x28Vq0wnoZtIin7w3eltmeEw8V79yPXj0zZ7b0UMyR7J0/xPIs
 fQjpuaoc3xwBf7QH1OIbxDaVe4bz9Sb81IKVnoUsi0dLTuzD9g45JhRt8AZaloXM
 ys3kUasTUNUcFLMX2bg64XPKLt1MJjzgVbLqX5ak555SHo5h2kjRu5YzKbiNBzKn
 HOIPcrWZB10fLBBJ72iQo1I0BHrtYLsGW/rIfjHpWwxJsJ2xt6GeJkXB3tTZHqMJ
 4qEkIZXCRRNlH7ZZQ/lLUbdAUoaKEDz24C7JoM/ISZYfVw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0qrgjr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 21:57:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4d91b91b6f8so33294441cf.3
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 14:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758837446; x=1759442246;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0PwCuPQqx8Z6h5Uvt2HeerM1J/nGXO3zl9oVlZVDBoc=;
 b=ESEnr2RBiGTxW12R/o+wzJU4/1N+THHmZsSf8Pgcc9iSEPp1UL2jp5RyoKufrggLcF
 IItM3gcvSblQmr3ShBiQBwGBtenGIJCGImHtQsIndmZZuIiuVzTm3wmIXFynwVVsj1TR
 HTWriV1YUoU0AFm0xcEkXKujBq7gy+GmmC80tI8TUyTGlk13R1ym5lH6AMVAwutX6uI7
 OB4bK1ImenFqQilRA1VBRCnQttiH2lj7tEHLMALcKsgFNA9h4ARMfTNWTgT+e/mNB+Pm
 wLREDRp6SPIbQQD/jhWzzVm8YFnydTh5kBJfKZcuPWlqR4nwR0HpEgH9UjtH+4Q2YNj8
 SOjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnXJQbk/1/Yrdn0JsxLhrCp0aw3a/u9CRyzo8xShQMJGpZeoC9fD6j7jo4dkOcGOC+vTlzTDNKqxg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy14euaM4GryfYVGPvR2iL4ysQFkTpCZ4VFZ5/r/0Mwdh11t3ir
 R29avzuduZTY+Luf+p0tqTTjXtUCsJbAI2JI5tHPPEpM43iBBXzS8zvH4/ZoSAkfEd938dDhhBt
 t9C8Sn2mwZOfAOx7hlwGqgS5CtdQSEK/AjKo5Zr6GYv9N0Ra0mdm8P1Odv8Ls+Hb2Q4Xvd4s=
X-Gm-Gg: ASbGncuzcmq2ty3fRFlajxmFtrhd1lPii+NMzQRI7Bf1W7RgMOAS2k60VfhtVDdXkbl
 xm0ucprNwEWd8RbMdfeujSjzHDlvBzsa9hSBy1LcfT+kXkYkYiMyEKm27ymPs8xbEHenlmOJtDw
 CYA6dN0/5M11rz4khrFSjG/uj7Xhvg+3uQnlGTQVuEH8Iuo8PLhS/2FpMmtXoPp4tlWPqGOwCJ+
 SwzTtbNnqy+7YsBZ1cLzBTJYuDmezZjOLEKCap/JDJKrE0v/33rO3Cr2L5IIzpqv/18vNJIKnXy
 /upvWSnoyGmyOTN3xo5YFTx9dqSy7J7xzP11WrwTkJKhQkhJurMMP9YQTNK4MJeT/0drkmVPF2X
 k2SXKX3YMaxOyKCYYOaKCTYUSbuTjyCkHMqVKljYqLqLuGvwpTmxm
X-Received: by 2002:ac8:58cb:0:b0:4d6:222:dd8b with SMTP id
 d75a77b69052e-4da4d31543emr60280881cf.83.1758837446390; 
 Thu, 25 Sep 2025 14:57:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUvHFm/VIoqIQAQiQZ6FSqSB9YMAic3boTm5yCXZXNdcpV35T3IBACEQOCvNWiglROD/o5RA==
X-Received: by 2002:ac8:58cb:0:b0:4d6:222:dd8b with SMTP id
 d75a77b69052e-4da4d31543emr60280581cf.83.1758837445940; 
 Thu, 25 Sep 2025 14:57:25 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58316a316d6sm1156263e87.98.2025.09.25.14.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 14:57:23 -0700 (PDT)
Date: Fri, 26 Sep 2025 00:57:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v6 12/14] phy: qcom: qmp-usbc: Add QCS615 USB/DP PHY
 config and DP mode support
Message-ID: <5dtlqq7x36gb7cmiunoreoe2vftq46pusb75sbol47ceazefpf@lxrx3hhcwhju>
References: <20250925-add-displayport-support-for-qcs615-platform-v6-0-419fe5963819@oss.qualcomm.com>
 <20250925-add-displayport-support-for-qcs615-platform-v6-12-419fe5963819@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-add-displayport-support-for-qcs615-platform-v6-12-419fe5963819@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 4NQQqbrGwm46-JqtrUG4DU5H0NGdpZhC
X-Authority-Analysis: v=2.4 cv=bJ0b4f+Z c=1 sm=1 tr=0 ts=68d5bac7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=cNq2fIDUiLOJNmzcDXoA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX2Qq/6sAyiGQn
 nsn9xrwCv+/ii/NqunUFgZVFqzTx2Cr3uXZDwIiK7bBmVsT3PxnrokI1Mynq8apN1lCS7J5+gu8
 ougtZRuBqsSzEAnlpTXYeWMgNk/Ql7uik7CeCvga62Q42BqjxA2Mbt3MLYwepk8r6QsPx39qsAB
 OUcIidNrA72Z+H4ehzRE15FtfTFm6Qx4Q+CvOo+D74Cqp8W0BSYPdyxE09JoffffyHrRj9ni6GR
 MsPIea6JhMvmzRDNHVp7Z3DJPBYeD/JqiaGp45wBBnro2GpWkr/r/gav1Ttam+ZKQkAKOYQ6+y8
 TreqTbcKRSdKZ6MRwVYbo6nT8EccjQY4IiuYtEHjvnmI3B4qZ7NVkRrhZRkfNIqFoIyi4voYX34
 3qtrs8UfykFF4DDrh1W42IdSzRThfQ==
X-Proofpoint-GUID: 4NQQqbrGwm46-JqtrUG4DU5H0NGdpZhC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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

On Thu, Sep 25, 2025 at 03:04:58PM +0800, Xiangxu Yin wrote:
> Add QCS615-specific configuration for USB/DP PHY, including DP init
> routines, voltage swing tables, and platform data. Add compatible
> "qcs615-qmp-usb3-dp-phy".
> 
> Note: SW_PORTSELECT handling for orientation flip is not implemented
> due to QCS615 fixed-orientation design and non-standard lane mapping.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 407 +++++++++++++++++++++++++++++++
>  1 file changed, 407 insertions(+)
> +
> +static const struct qmp_phy_init_tbl qmp_v2_dp_serdes_tbl_rbr[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x2c),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE0, 0x69),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE0, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE0, 0x80),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE0, 0x07),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE0, 0xbf),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE0, 0x21),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE0, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V2_TX_LANE_MODE_1, 0xc6),

Hmm, I just noticed. This register belongs to a _different_ space. As
such you can't have it in the COM table.

> +};
> +

-- 
With best wishes
Dmitry
