Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F283C87D23
	for <lists+freedreno@lfdr.de>; Wed, 26 Nov 2025 03:26:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262CC10E4FB;
	Wed, 26 Nov 2025 02:26:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MIjijmdb";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZVIuF+cg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2CC10E4F9
 for <freedreno@lists.freedesktop.org>; Wed, 26 Nov 2025 02:26:10 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5APH2uUb3738349
 for <freedreno@lists.freedesktop.org>; Wed, 26 Nov 2025 02:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=TxSG1ManjepYP5kIvbTRIx6w
 sMG9QO6qn584WZ2KdCE=; b=MIjijmdbj4J9ynEqZ5gC2dJ5dIiY3zSRDJiUt5tU
 8x719mlOxmciR+E1sOQVi1ygJ1bUuoJhgnhahm+dY2yR04FQqgIQfcaorhPmsqpL
 KH4j6yodePHJE58LI9Ly9VbR2rPJ8pvJq+3poRWDwNh4XHROu0xUwm6SokgvDEUn
 G+hL1a6eueoxcBHJ0825/V/s65XLI9BFx3DJxb38TpkZZOZnb4T7/b+gGiVdL8+V
 h8sYww3HaajvD5OdUUQqLz0jwHnQ0bMBRuVOHIVDxm3Z6gkZt2CVuxT1/ipp82Y6
 pC2LUqUHi+5k/jE16CgvqLA5qPCiWUrv7aYjbU6A6EmM5A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anggyh841-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 26 Nov 2025 02:26:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ed74ab4172so151585151cf.1
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 18:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764123969; x=1764728769;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TxSG1ManjepYP5kIvbTRIx6wsMG9QO6qn584WZ2KdCE=;
 b=ZVIuF+cg66mW0Flb9JbLU1cIpWRYoIobyAhm34C2YCl+8pHF2zhiXrusy1MQJyme+m
 dkVydvAaAT+koDYho3AgjXzciQ4G7QdcnYXq/UkaJSkJes0ZGmtSKn6a+V23LLI0Y8bl
 WGjUNuD9ZhCKCa2r1ElV6VLj8/yo0UteqaoQ+12IOGjXeKDqdHpHR7tVymxQQhXYaOeQ
 /I1oO/pWIqrrSD0kYw88okQSZl42LfGe7eWNwxmbr5vSLtHRbrQhCrqxSmlxCf1FYRaL
 FhtghbmLKJ6ZrMNLG3s43RT2ZUyQQHmbOzKeIe8bqscDFcFe64Ne2nKGb+qj1EEYs0kO
 NWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764123969; x=1764728769;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TxSG1ManjepYP5kIvbTRIx6wsMG9QO6qn584WZ2KdCE=;
 b=WK2/Fpl7FiZQL/dSY7d1uOPvRAFoIfxa4NM/Ut+LuPZLw6cX5m3ponSHd6PVmH7Dvu
 A/Va87mLoKrW4kizFoTtBovGQcaPbIDlyX02yMg6woVUgCJUWoxNOcPQocqci0rbJfKC
 txf/MZMCJgEsW+q1BuuUALRyVaUxtjf8n3PMFEYkUSpJIOtJ/nXPiSwsS5Nw2iflgCSa
 DmxZbIw363v+XnHkauKLcQmUefqLOZJuawZu5uNyPBE4SQZfi6HbaPOU/SWaqydoEBkj
 OopCAf90WyBXnAT6FXoNwzlNYlKT/RMrsV23DtlbW3Bk6MrPuA/HwL7i3xI2YS/Sjxau
 mGdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWV7xTtDzoBchE84e4P5OmTFARPG2C3LpmaW52kC6rr5mIOQMoLGWmFyLQT6zTYpozb22BXtIx/XS4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywy5o+5XqqqX+XQgUxURQCyHTag041N2pUrFVm8A8E0BUrGTKVv
 rSYzb10czYEd5LETrA51mN+dhtDeOhjwbXIYaY8UM2CmO1n83iU4X98UWcgJ18lodYFchSxcwAE
 8SrDqY2kgFVIr8oa6P2l/bZoYLl7rvMprSUGzBQfjW16VOpCGmjgw/g7PDBNxvjpxn6fDErQ=
X-Gm-Gg: ASbGnctIhxnS5sSLH2gPPoVylDWmz1T3eK1OhkIfxmj/oQWbGWvlS4WwH1hBiidTM06
 rU/Z0ti3vcN884fWTZ7XtdDxmS5Ta/zkATcoQlfqZS7EBqRQZF03Y78jGJsXRLi9lTwGz0z9M26
 gcqwiNQFGt7j+xpxZYEz1E0R9BkE+lK+FEkUOoJ/du3Kh623NOf73zJjKhB1S74ecVBepGrxbP1
 Kf68ElYnyRkCMTq5f2opFhrB3sJAYKta3c9je3LNH6zZDJ1cQAwp/yazzrwFj9FseTThCuGen+u
 eCmw5wERNpaPkqWYOjjXhtIFbkF2cIJ6TMDWr/H2jUuztBFj5dS2ZhMrNzw/7rDJVr000WQ7KXi
 Oaec2bLzEEfqKmxEE/4reWvf97eos4R96ldIb9IGA9swLn6hBrkVCIVSgz7RrsQ37HadzIF6zqW
 8=
X-Received: by 2002:a05:622a:1812:b0:4ee:4709:4c38 with SMTP id
 d75a77b69052e-4ee58943fb5mr234067751cf.80.1764123969278; 
 Tue, 25 Nov 2025 18:26:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEz8HcPa9d0VpPpenRMeT+be3LkzfrhEnN46hyIHhUBzFTAfu0MT5HHoOY/YvkYm3AIa6rYVA==
X-Received: by 2002:a05:622a:1812:b0:4ee:4709:4c38 with SMTP id
 d75a77b69052e-4ee58943fb5mr234067381cf.80.1764123968793; 
 Tue, 25 Nov 2025 18:26:08 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8846e5749bcsm137582306d6.44.2025.11.25.18.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Nov 2025 18:26:08 -0800 (PST)
Date: Wed, 26 Nov 2025 10:25:57 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: Re: [PATCH v2 05/10] drm/msm/mdss: Add support for Kaanapali
Message-ID: <aSZlNaMSRYRLwYhx@yuanjiey.ap.qualcomm.com>
References: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
 <20251125064758.7207-6-yuanjie.yang@oss.qualcomm.com>
 <teg6is2sw35s5nyd6df74hwhctnx4txjd355reqpgfwl7xtkq2@e2rzbskjfz26>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <teg6is2sw35s5nyd6df74hwhctnx4txjd355reqpgfwl7xtkq2@e2rzbskjfz26>
X-Proofpoint-GUID: qcguJE_L3CTD1jqEUSYtCxPGnAjLowbh
X-Proofpoint-ORIG-GUID: qcguJE_L3CTD1jqEUSYtCxPGnAjLowbh
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=69266541 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=inixIHUC_2VtAalyxKMA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAxOCBTYWx0ZWRfXz8VQ227tv9bU
 2L+zwWO7BXCGtLdnOnckoIligvEcbVo/kca2W1F032sps0qG09W5na0Wjf/hY3RLIQ/zGV/HOA4
 PcZ4VnAiNW6++y7MrbJPQK+CeX8ePStU2GTKaPftO+MvJb2C7JAbd+uWyEu7Kq/7qBGGh81urld
 v+Alo0WinOfKLBAV9Ophfmc5tELp4Vwuu8sYVJ0GiTYJHXc7RRe67FzvxGQGlOcV6JIPC9UKcyH
 h1FfJShacqRguZxXB974rdBSrhr6AV1HV/fioSFsd33RobOFkJ3kKhRXarYjR1+tkl2cBtpEWlY
 vKd+tNA2M4UMjlmGJVjLWcwjEFPQc2eN6K/lGQEabFyfS//5TIyZu5WCnmdjJvIy/kFlSecz+Bj
 /KX0HXWf5HgPXhDuqHou63jBeVy8qQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260018
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

On Tue, Nov 25, 2025 at 04:47:09PM +0200, Dmitry Baryshkov wrote:
> On Tue, Nov 25, 2025 at 02:47:53PM +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > Add mdss support for the Qualcomm Kaanapali platform.
> > 
> > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/msm_mdss.c | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> > index bf9a33e925ac..797ef134e081 100644
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
> 
> Can we please merge this with 4.0 and 5.0 functions?
Ok , will do.

 
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
> 
> After glymur, please.

OK, will do.

Thanks,
Yuanjie
 
> >  	{ .compatible = "qcom,mdss", .data = &data_153k6 },
> >  	{ .compatible = "qcom,glymur-mdss", .data = &data_57k },
> >  	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry
