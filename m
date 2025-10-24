Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3198BC0435E
	for <lists+freedreno@lfdr.de>; Fri, 24 Oct 2025 05:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C09D210E9C1;
	Fri, 24 Oct 2025 03:06:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fYsRSshu";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D226D10E9C0
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 03:06:04 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NE1mw8014616
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 03:06:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=4ytYg5wIvSCF5vB30aPZTmXG
 +DpyzHPysWUr4KYo2nU=; b=fYsRSshuTvO+iBk5tEhQCKqPmdb2or6LOosi9rAC
 sE8n0mV26VqAOMrivDpDydH4xNXeb3a6WM/rCkaPQ4XhSCaJPOutS4w830G1eZ4b
 pjagGIwREvBJ0Zl3PayxpEFyQD0p0DysLmVSDRNnltMj9PPJHVYkkyBGLf42Ikms
 aiW4Sfojd2PpUhxTt2ScCh+Q+66/Rhv74ouHZOBoKOKTHtKwnIWxb57jbAibCUwk
 0Z614UqV4ncT72ley/V4M0nB1MMfYz/HqWVCLXbYc+pD3AczEXH/vJkavOAD0mQe
 J+CzFpbxF3KXG7sTqHFetW/ssn+EwLQRpL+yjYzOMw2uuw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0rjuv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 03:06:03 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-87c1d4f68fcso54488416d6.2
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 20:06:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761275163; x=1761879963;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4ytYg5wIvSCF5vB30aPZTmXG+DpyzHPysWUr4KYo2nU=;
 b=bAwNUbDIGTbuCp2iYZD532sfaprNwfk+m0AHVWGT2clawL7o6gtnlZFtIR5iBrZFa3
 iWbOw0P3Mz6ewkFxX+ZSD+Sm0khFsBVTc8IoMnEd7sLtMj/UKOQ81lDiA/QLS7zbQHdP
 c1zD4EvxF56WJGqRiT8qcVWsvtO1s/lvVDbUwpfMVkkurbvYio3GIlHLoIkaMyau19M9
 K+tL7wqbUym+f8LBbI4G4vYqx7GT1rDHM+0DOSe2dfLSHdbs9Oqdn1+dX5nIo18ANplW
 5wuM2R5qiklLJMavuhF2dCSuuKLQNHGU4tfJgRNYP1BGKDfccU8NVNtjhrzGfxImuc4m
 uKYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5V/D7SXb+r8c8TUl4WdwayBUDaumb4u+IaqqAsfI9ELf5rRAMSaBz+58K31co60+Z+N6ddyW1afs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzhbl9UOkZdkSoOafoOfpeW02NC03MvVAcLCKdE31VFlUYUo4Di
 rLpzLSh6zv4i93TYfw47CLSccV5BfX798834lTcwkP2OR/nmUL67L/q2dMZ7d/OQuqvPl9r7ML7
 9wlf/zP6sGr0y1vDT1ZVsHL9eC+1zPJqZ/3YvRl7Bao9CgIyfCbYhbdf2OPcqyR2AbMxSbG0=
X-Gm-Gg: ASbGncscNm+qEChp/+JkwUJoeh+hVw9bYXltUUb7xpz597CVgHRU19ZAAyd3pfSAqz4
 Dlsx0xvpvH0guu9f8+VIY30k0wvcWrqir08NJHuQ7ZNiXKArwlij2N74USGy09VTdl5qFPP/y4h
 FmT5IF7dIHiWiMEdKjT5L6kWR439msi4VDkoEQpmIS1iJyEc078r/1SqAd8a5wi9CmnF4gVujeq
 ZLh6KrG9BRIBHWE5Urna1MZpQ+I19+LJCqc8OfKP/eopkkEgfquk84mVl6Wc36QU5cPd+SCY8XP
 Kva5IWhKZ8nlG3GYrl3AAboCiFIlZHX0ma6y5SgoRBSWibYrjXeHFSokyIoymYHk3U8yPBXN/Wj
 PjqV1LGoS+gUCZ9shQeE6b9rS5cjbOvDe4rIhzL5qKnSuuIFLjaYbzjhVsc2Y
X-Received: by 2002:a05:6214:27ef:b0:87c:dff0:7c1a with SMTP id
 6a1803df08f44-87cdff07dd8mr268989936d6.13.1761275162834; 
 Thu, 23 Oct 2025 20:06:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkcreB+0KcKKEZo2+yTp/pEKF7bGUgeuh4BxWqNNLIOy98t8bmDiGhZCsT7X+sb2q+MU8G/Q==
X-Received: by 2002:a05:6214:27ef:b0:87c:dff0:7c1a with SMTP id
 6a1803df08f44-87cdff07dd8mr268989566d6.13.1761275162274; 
 Thu, 23 Oct 2025 20:06:02 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-87f9e824a77sm27351446d6.60.2025.10.23.20.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 20:06:01 -0700 (PDT)
Date: Fri, 24 Oct 2025 11:05:50 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 04/12] drm/msm/mdss: Add support for Kaanapali
Message-ID: <aPrtDoW7QlNSH12X@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-5-yuanjie.yang@oss.qualcomm.com>
 <7yrjpxx2uqb7ox6yk55hsdj2cgexvcoqjjutmhnjokciy7pnl4@a3zdvmn7wmto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7yrjpxx2uqb7ox6yk55hsdj2cgexvcoqjjutmhnjokciy7pnl4@a3zdvmn7wmto>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfXw9/1AgAuMGPb
 hG21R1gvcwh2RXDaLjemgh/AdcbTSkpXs6bmLhmVTsO5WTU2qcJAaTRWmdxjCX0pMXQgeee0BfJ
 5Fay24vJbXULVE802WAELRbdKgMEazkP7rF2AqsRUqBT5Banwq6HlifCPemhynEDcaVIWrKmLJo
 C1OTZqOYvdra6ds5B1fCz1CUHyWlXLZ5+WXhyo7yDR31pJauqHnktkx/DhWwPiHnFmOM1cnlj9p
 5BI10v2ZQHAy3Y1IlWLR6zMYNPfw00ryJY7AZAwYNNjIucDTgNJ5Hbgzxmw7N59Oatr0o8eZG4x
 GccDxXWwQhkYUHojd3CtfxuqCyB31finRS5dzlvkFweuhcKKWy9r1nc7YSjVNt/dJ8NVfXlkj4P
 b1uP/kytarm+XnON1Ng6+0hNg8XSQA==
X-Proofpoint-ORIG-GUID: BhYOHX9bdoe_-PiuZZDElRcM4oEJztPW
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68faed1b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1k5Ug2qgVVKK0g3C12EA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: BhYOHX9bdoe_-PiuZZDElRcM4oEJztPW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167
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

On Thu, Oct 23, 2025 at 03:01:14PM +0300, Dmitry Baryshkov wrote:
> On Thu, Oct 23, 2025 at 03:53:53PM +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > Add mdss support for the Qualcomm Kaanapali platform.
> > 
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/msm_mdss.c | 22 ++++++++++++++++++++++
> >  include/linux/soc/qcom/ubwc.h  |  1 +
> >  2 files changed, 23 insertions(+)
> 
> Where can I find the UBWC config for Kaanapali?

https://lore.kernel.org/all/20250930-kaana-gpu-support-v1-1-73530b0700ed@oss.qualcomm.com/
I see UBWC config is in gpu patch list, so I don't push UBWC config patch in my patch list.

so I should wait gpu patch applied and rebase this patch ?

Thanks,
Yuanjie

> > 
> > diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> > index 2d0e3e784c04..665751d2b999 100644
> > --- a/drivers/gpu/drm/msm/msm_mdss.c
> > +++ b/drivers/gpu/drm/msm/msm_mdss.c
> > @@ -243,6 +243,24 @@ static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
> >  	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
> >  }
> >  
> > +static void msm_mdss_setup_ubwc_dec_60(struct msm_mdss *msm_mdss)
> > +{
> > +	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
> > +	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
> > +		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
> > +
> > +	if (data->ubwc_bank_spread)
> > +		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
> > +
> > +	if (data->macrotile_mode)
> > +		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
> > +
> > +	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
> > +
> > +	writel_relaxed(5, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
> > +	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
> > +}
> > +
> >  static int msm_mdss_enable(struct msm_mdss *msm_mdss)
> >  {
> >  	int ret, i;
> > @@ -296,6 +314,9 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
> >  	case UBWC_5_0:
> >  		msm_mdss_setup_ubwc_dec_50(msm_mdss);
> >  		break;
> > +	case UBWC_6_0:
> > +		msm_mdss_setup_ubwc_dec_60(msm_mdss);
> > +		break;
> >  	default:
> >  		dev_err(msm_mdss->dev, "Unsupported UBWC decoder version %x\n",
> >  			msm_mdss->mdss_data->ubwc_dec_version);
> > @@ -552,6 +573,7 @@ static const struct msm_mdss_data data_153k6 = {
> >  };
> >  
> >  static const struct of_device_id mdss_dt_match[] = {
> > +	{ .compatible = "qcom,kaanapali-mdss", .data = &data_57k },
> >  	{ .compatible = "qcom,mdss", .data = &data_153k6 },
> >  	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
> >  	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
> > diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
> > index 1ed8b1b16bc9..0a4edfe3d96d 100644
> > --- a/include/linux/soc/qcom/ubwc.h
> > +++ b/include/linux/soc/qcom/ubwc.h
> > @@ -52,6 +52,7 @@ struct qcom_ubwc_cfg_data {
> >  #define UBWC_4_0 0x40000000
> >  #define UBWC_4_3 0x40030000
> >  #define UBWC_5_0 0x50000000
> > +#define UBWC_6_0 0x60000000
> 
> This should be tied with the ubwc config changes as this chunk goes into
> a different subsystem.
> 
> >  
> >  #if IS_ENABLED(CONFIG_QCOM_UBWC_CONFIG)
> >  const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void);
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry
