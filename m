Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44444B8AF54
	for <lists+freedreno@lfdr.de>; Fri, 19 Sep 2025 20:42:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58ED410E060;
	Fri, 19 Sep 2025 18:41:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="blqNXqNa";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED2B10E060
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 18:41:54 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JFUJoq018269
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 18:41:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=i7CxFXs3E+TxXdjR6pU++0nh
 zSKDiXUs6/X+r4T9DOg=; b=blqNXqNap4RdDUrGJHaDIHahSPTcmOFjAAK+36Di
 IhcA+6lelkrQOZIVWpJSuXMeRHzdHh/A85okxRiUZtD/Puq0p0o1Yl9sFuPKUK3S
 GNpN8JmcC0KqZyKFIkCGuQkKMeGpqo+0jIGMOh4UqHFF8icYmbfvlttCkDjGuLFJ
 5o+m737uE+ltICx5CWLeNg1rcAzxN12kRS1XVv7MD0EYOE/4Su0r6i3TCEQf6XIW
 yPJ2GD8bmI49TxO1khkl/iLaIwqip/E3oZfAVS0rqEuAjU6wOFRLCI4EKfiE4irS
 AG8X9GKy5YRMaiXaJVO0WNnRG4/C0yhxFIBUmET0gFBhIg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxwkfdj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 18:41:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b345aff439so47963201cf.0
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 11:41:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758307313; x=1758912113;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i7CxFXs3E+TxXdjR6pU++0nhzSKDiXUs6/X+r4T9DOg=;
 b=ZO0tQ2rtkv0WBrf1VO6Sra9hVjMRvexXZbQIWpwG/9XgYJ/j8gNdQkicychpZjno7F
 m0HnXccxQwjYlW8KOsJRIashxMbMenHszTMN7I2rikG9bRJc5yXhp8hWSkJnsQ0nuAqS
 jBqJpfHy/5Qt5YMLjyBNA3ojETpAV7m4rgDMK9ocxvYbEVQCrfRYH8fINse2BPQMLxto
 KjHXPTWtKskbkJISgCXtsrcm7H0dDx31kYyyL+sCHOvAnDrtsAT8+Hg2o5tDzJ26IX54
 S4SVfYUqhZ5KqbwGe3eDKCfwxcwf7FrSZvfcmP6VtQW1ocsRCMZZb5/L+jwyK0Hkpq0K
 HXZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEaYQ+czCcRknH1RxBpFvpWneUMWx4fX2EuEPo5RDUtQbur+JS+DyojBAwGFbYgx2YGPmLNq7114w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhA9ULoQddYErhLbzb65xkyEWISGb4IFAjieMcHL1jry+YN6bH
 4lLmfpDRdinnXR07usL8c/w/Hkj7fMPF1lTflLLGR21n6+l8eoqnlRtqeZrdyrs5HU0FZHX1/H+
 H+ep6KdRQf7wGqLEJDbIcG3/pVbxjFXDs1UzH2V7fjLP+X19Pe0RM+buFGzapabOIevt5ipk=
X-Gm-Gg: ASbGncubX4dYcUv6BEbNGcLyfKMPpNBUZXBOqjStwSg6iMjrX07JHw22ngV0m6XwGHy
 zUMSjs81nY6bfhgzjeq7+7b6MCRp8DLwylc4cbeIiZ7jnq9K+/gL0HNlmDD+njtRcLrGJQ9bjA5
 D+2JlWO2QEF5RzcUNL/cgROUWIt+qz3WJrFimbSURpj8wXmFAcOB8IJpnPVYJc2PzSl9BpnV9aa
 g+0qJJ4XW7qa/ubQA8rNbp8wvIks2t2EOQfyrCdoLvpN0X0qL28m28Tf6EhUBEXGlJjnUFs3lCQ
 dJ0IEuDD6/rjNKgXqk2SDAeFg3wAqPTwHF2+G0iPaqW94FkBIBn5AAAAydJ1lc6t4KGDw2HLzja
 Opk+1ujXQ9D/1A8kYz+rZbdMJmYnJtlsRrd8WuW+jv0Fqq8K11Tgg
X-Received: by 2002:a05:622a:491:b0:4b6:2336:7005 with SMTP id
 d75a77b69052e-4c06d6828d5mr48024571cf.19.1758307312796; 
 Fri, 19 Sep 2025 11:41:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+jXszKO5APDEximPKgrAQZzyc5+8giT/WjH1lhXJNUczhHvAVEcXJ87AWsBXaMadhHq3byQ==
X-Received: by 2002:a05:622a:491:b0:4b6:2336:7005 with SMTP id
 d75a77b69052e-4c06d6828d5mr48024191cf.19.1758307312164; 
 Fri, 19 Sep 2025 11:41:52 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-361a99e9024sm13738501fa.49.2025.09.19.11.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 11:41:51 -0700 (PDT)
Date: Fri, 19 Sep 2025 21:41:48 +0300
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
Subject: Re: [PATCH v5 12/14] phy: qcom: qmp-usbc: Add QCS615 USB/DP PHY
 config and DP mode support
Message-ID: <bfpgktxgo2hb6dpzy3i7jdr6w4de5boorx4n6qeapct2vre4sn@4z2mnppridn5>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-12-eae6681f4002@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-add-displayport-support-for-qcs615-platform-v5-12-eae6681f4002@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=HbIUTjE8 c=1 sm=1 tr=0 ts=68cda3f2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=XgMPAK_adSAUw0pB5X0A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX9YpR9+c358O3
 Wh828JmbwPm7EhTpImRfp/zpv0zWNQM4e8/VK+efE4TtmK5fxHsLBHK58giQWTuIhfqlH3ga70S
 B6AZ/4ijROYJFgRYT3buNWZMZ+0+nlGTbHoW+GNwwOCRIoV6ZQnxyl2rr7KAlD1wbBp6g/G1Rwp
 WI23jBciPg8GGrr3QjZkoafbtempKm6iqEGfwZKflj9CVjyxtYUOtS/+DaOp6uT9Yl68/Vsd5d7
 zgI7Cx7DfPOd2ICSCoLfrecEm24139Rjp0EAYqHjtiRNfubAzKpWirgnAA3sYAkhH/dp6taK7qO
 dNaMW4G2JSC/tdNpMsOm+ENfKi8NeCUvgtWCs2KgcqNZT46gfwggVnFM0wyTGM/377iphiX9iN2
 /fjKhKWE
X-Proofpoint-GUID: UACCxW-OUaPrI5SxBCaz4I1F-EPFI319
X-Proofpoint-ORIG-GUID: UACCxW-OUaPrI5SxBCaz4I1F-EPFI319
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
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

On Fri, Sep 19, 2025 at 10:24:29PM +0800, Xiangxu Yin wrote:
> Add QCS615-specific configuration for USB/DP PHY, including DP init
> routines, voltage swing tables, and platform data. Add compatible
> "qcs615-qmp-usb3-dp-phy".
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 395 +++++++++++++++++++++++++++++++
>  1 file changed, 395 insertions(+)
> 
> +
> +	writel(0x3f, qmp->dp_tx + QSERDES_V2_TX_TRANSCEIVER_BIAS_EN);
> +	writel(0x10, qmp->dp_tx + QSERDES_V2_TX_HIGHZ_DRVR_EN);
> +	writel(0x0a, qmp->dp_tx + QSERDES_V2_TX_TX_POL_INV);
> +	writel(0x3f, qmp->dp_tx2 + QSERDES_V2_TX_TRANSCEIVER_BIAS_EN);
> +	writel(0x10, qmp->dp_tx2 + QSERDES_V2_TX_HIGHZ_DRVR_EN);
> +	writel(0x0a, qmp->dp_tx2 + QSERDES_V2_TX_TX_POL_INV);

Are you sure that these don't need to be adjusted based on
qmp->orientation or selected lanes count?

In fact... I don't see orientation handling for DP at all. Don't we need
it?

> +
> +	writel(0x18, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> +	writel(0x19, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> +
> +	if (readl_poll_timeout(qmp->dp_dp_phy + QSERDES_V2_DP_PHY_STATUS,
> +			       status,
> +			       ((status & BIT(1)) > 0),
> +			       500,
> +			       10000)){
> +		dev_err(qmp->dev, "PHY_READY not ready\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}
> +

-- 
With best wishes
Dmitry
