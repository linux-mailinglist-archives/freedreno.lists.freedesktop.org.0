Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E55FFCDB25C
	for <lists+freedreno@lfdr.de>; Wed, 24 Dec 2025 03:18:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB75B10E30E;
	Wed, 24 Dec 2025 02:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o8/7f4N+";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BhgpvGtK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D976810E30E
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 02:18:37 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BNENBmf913517
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 02:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=tQh2uyWtEkYSbjZSvJtcdk3s
 4J7dVAuke1UBIGUMQ8Y=; b=o8/7f4N+27ErkkhenfoZ0tzOz0EXDlwC+7ogtcdt
 eIS/92TzYJEtVLZD3RVoziDhGaPScTu5iel4sEMlG1mSLQHWkCfSAfihwWOWOx9j
 BcoLko+UQ5MNIvAP05Rpcm030xdgdelXhnkKW//g4tzNAl1OLcXVq8W7bsVi+SzS
 kqxOFzHPAI9wFczpD2RP6j5v9vhADcqdWAZxpAdO/gcdElEVqVVndNuUQAvSGOUu
 mu8K30g00dppK+mPXMzzOV09a8EJBJuNfRdJmJzboTTntxOakFNBu2X/lb6OVWaF
 95OI7eaBZ8cDAxSPu6nV4mdYxANdsAQpZu2e+mDFRAmO/w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7vt2hsrb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 02:18:36 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-88883a2cabbso190034736d6.0
 for <freedreno@lists.freedesktop.org>; Tue, 23 Dec 2025 18:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766542716; x=1767147516;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tQh2uyWtEkYSbjZSvJtcdk3s4J7dVAuke1UBIGUMQ8Y=;
 b=BhgpvGtKayzBa5c8jrsnjkm2+JR4ft7VDDmQTn8MjIx/3ujUo64O+0F6YBUF6uSef/
 nkby5llFmNKwK8NkcYA41p/XNYl791W8i38MgSPNidQ1B65FuZa8oZHVho416VpA4azE
 ej0hEZv81CFB1Kf+BvrQzBAfqgfaGOQ5Quhpi7blIOA6wQJHsh3Rt+4FdDqxzb0JNgZ+
 ZIXNmE+PamVYtWvgXMIuf6PQNJ3C6nvyESek1lAvzlM8hs0J0w9v1DzCI5DuUZxu7EKc
 Gv7KYUuOVQtgPdeL0QIuME7Govw19TZzOlm4IVQbSZWHnFHET/3YdtDRawGBBsy2qvyT
 AbSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766542716; x=1767147516;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tQh2uyWtEkYSbjZSvJtcdk3s4J7dVAuke1UBIGUMQ8Y=;
 b=HSbzqbXrbnY0wT9zWuoD21LdqZYB/rNWrnlJ3GQVy393xEQscBXIOlqSPyEv2A258i
 s9oYJpGlDhXLVgjGGWghUp7l9juh39ylta5T1RKR+CXBsoeXEcmpYLNdZ9Ipb4fTphN1
 gsIC0Oj6hxNaNOpOUJ2jX/uUt3ojLrq6zdtS4o5jk89jX4xIclxPuaRKrKm96AmFXoni
 zeERFGk7NAwxxCJXgqu4VyWUMvhkqjuu5gTJbJQg9PvjhZl+LOveWr/LbKD5phdzXVtz
 F7Vqo1GcS70tIythL4/wfuZYOaVB4bhOWOYjpKsZCLA8m4F0tZ4xdIIQGGSDsf0ncxvC
 ce1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSWivPovk3LFdajetCCj1labVJE6mQpbJIzS3oP0eUT9VQT9KZW5cdZoq/mrtwPuF54MFxVn+Gp9c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5QEEsc4ApDw+zu4zJvaSGNZDsJIaCp6gUW5WRo0+LX4s487f6
 wbvfF0sx66NSXBW98n9i+enE0cAdEwFUJ7sUVbDpJfd95EIGHyaQ8XVotSbP6O0+fdNkboL8mXd
 IsZ7t3o+sA/Okqk2QIQXDR81oyXwXoI02t1Rt4WPiTD6R25sBMexHxyramlG4UufAAFTxR9k=
X-Gm-Gg: AY/fxX7sFdWIdqPfyXmmYmo62A0ZNg8VCww5TqjXWSmMx/uKmDhbI0H4436/6t5BEzd
 /bYORe0ylN2HDjBC5vMGCSP4SQoJjN+ODrDMt59+J8LDQ6eut/ggVj+TXE92NtQLdTzibjKzvAD
 Y2vDdRaVCHZyPt0swWhV1jsLSPi+vfoQ0WDYAsAwgJGeIBaLX2W761GpDvr2ZvsXOqGyfNsRdPS
 vDRaXX0Ir+e/gBzGRHc31qgxEqrXLV59cD3MZyDzhWlAP32Y4GMrbAj3vAquC/bnGOdzIvMqVmt
 DZQvpc4rpxn0r+5ikdsQyrn8s7OSbbfU0CSzZDiYNMiVF0ZmEmj6ahsOW5krHVPli3JLH94ui3t
 7bWsDlWAGSnW8bMuOxFsjDjwPHgiOgzy1N0JosvjeCoSTWWYXcjPuO7r/HOYj67bjXkMUBKI=
X-Received: by 2002:a05:6214:620b:b0:882:42e6:171a with SMTP id
 6a1803df08f44-88d85e98d6fmr208913046d6.29.1766542716365; 
 Tue, 23 Dec 2025 18:18:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHce/OgseXundlepJPywtUfFR71gFQZx99NpJKoPLugRkc5EhYW+YXWFPBqYlzsNAVukmJu7A==
X-Received: by 2002:a05:6214:620b:b0:882:42e6:171a with SMTP id
 6a1803df08f44-88d85e98d6fmr208912696d6.29.1766542715942; 
 Tue, 23 Dec 2025 18:18:35 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88d997aef2esm117824486d6.32.2025.12.23.18.18.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 18:18:35 -0800 (PST)
Date: Wed, 24 Dec 2025 10:18:23 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH v4 09/11] drm/msm/dpu: Refactor SSPP to compatible DPU
 13.0.0
Message-ID: <aUtNb1nkpfa8hSCA@yuanjiey.ap.qualcomm.com>
References: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
 <20251222102400.1109-10-yuanjie.yang@oss.qualcomm.com>
 <bqmk32aahvxzhpzvtzpvxcbstbrozjocmx6enkry5z7owdavax@7xtgdizvjomt>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bqmk32aahvxzhpzvtzpvxcbstbrozjocmx6enkry5z7owdavax@7xtgdizvjomt>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAxNSBTYWx0ZWRfX5opPJmQXwf7b
 G3OxEGfy9gltjgQVa+mttORP0yuEmISSfXu4f9x2oguIvsGzoNeiG6dxLswh7AkBKANWAXRVUnD
 yJcWwTy/FXH0AeoITqdCc8CLJZjtGmEaPDo7doAb1wy2adW2F3V0XtZERfTJnlc08RGTIPuoxhi
 tEWb1mzi/anjTj9GEFOzC/80CUbWAnhymTMM3MOm2biVlzOFIu8Dknc7jKeghwpGjU+E68iwUb9
 CiKFZyWEeU/OZ/EKUhOHdz+BZJvOCjKwDuyc0KkvrZxIesDf+csFS2XW+gIv3JD6Yc7GeK1JYZy
 nBtNcJ/HiR/kK/wy81SO24dP+P5u583kmx0LYIjKTcrZnCXzQlcUaWGCwvlT9f62W09CZsm5Osw
 /RuBQDUvz3aFYGCO9hDWltgHKg+d1sXcvMgFftatf+YHNDU6MHt3eML1hwEvEED0fiKblYcVdrF
 6y03VWaUE1mpr6gciLQ==
X-Proofpoint-GUID: _OQ1I_j29oFx0EKE_sIRYJYlhwZQMlLY
X-Proofpoint-ORIG-GUID: _OQ1I_j29oFx0EKE_sIRYJYlhwZQMlLY
X-Authority-Analysis: v=2.4 cv=brtBxUai c=1 sm=1 tr=0 ts=694b4d7c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=g2-dxqoBfl5MPgs3cbgA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240015
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

On Tue, Dec 23, 2025 at 10:26:03PM +0200, Dmitry Baryshkov wrote:
> On Mon, Dec 22, 2025 at 06:23:58PM +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjiey@qti.qualcomm.com>
> > 
> > DPU version 13.0.0 introduces structural changes including
> > register additions, removals, and relocations.
> > 
> > Refactor SSPP-related code to be compatible with DPU 13.0.0
> > modifications.
> > 
> > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  14 +++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 110 ++++++++++--------
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  52 +++++++++
> >  3 files changed, 130 insertions(+), 46 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > index 336757103b5a..b03fea1b9cbd 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > @@ -208,6 +208,18 @@ struct dpu_dsc_blk {
> >  	u32 len;
> >  };
> >  
> > +/**
> > + * struct dpu_sspp_v13_rec_blk - SSPP REC sub-blk information
> > + * @name: string name for debug purposes
> > + * @base: offset of this sub-block relative to the block offset
> > + * @len: register block length of this sub-block
> > + */
> > +struct dpu_sspp_v13_rec_blk {
> > +	char name[DPU_HW_BLK_NAME_LEN];
> > +	u32 base;
> > +	u32 len;
> > +};
> > +
> >  /**
> >   * enum dpu_qos_lut_usage - define QoS LUT use cases
> >   */
> > @@ -294,6 +306,8 @@ struct dpu_sspp_sub_blks {
> >  	u32 qseed_ver;
> >  	struct dpu_scaler_blk scaler_blk;
> >  	struct dpu_pp_blk csc_blk;
> > +	struct dpu_sspp_v13_rec_blk sspp_rec0_blk;
> > +	struct dpu_sspp_v13_rec_blk sspp_rec1_blk;
> 
> This is a refactoring patch. Don't add fields (and structs) which are
> not used inside the patch.

OK, will add in Kaanapali SSPP v13 patch in next patch.

Thanks,
Yuanjie
> >  
> >  	const u32 *format_list;
> >  	u32 num_formats;
> 
> Other than that, LGTM.
> 
> -- 
> With best wishes
> Dmitry
