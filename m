Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB27BCC1356
	for <lists+freedreno@lfdr.de>; Tue, 16 Dec 2025 07:56:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF8410E6EA;
	Tue, 16 Dec 2025 06:56:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cvvn/6aS";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="REeJAHOb";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D19310E6EA
 for <freedreno@lists.freedesktop.org>; Tue, 16 Dec 2025 06:56:45 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BG158Qs825901
 for <freedreno@lists.freedesktop.org>; Tue, 16 Dec 2025 06:56:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Qq0o/o5mq7+GYYh0mZ6Yhmwi
 FC0Spd5O2WRdpBvbVAI=; b=Cvvn/6aS1fWlxEEenRLUS0s4I9haInDuEiH/qQP+
 DHHdpTokI1Bjix2M41K+4n/kuHof0RYJEaiDWN0boqNGbuNlEoOqEY/4btGilgKc
 /lvXq1YUK6gS9O7ImNI4aLBe0UEPnyPGA+mwz9BMBaDjYZeZcnEWG+klsgbfK/qi
 L3rhpJ6IWn7Y3bOiNX3cYwe4XwM1bOgXW+j1HASZwr4QjYN8d7YSdpFYsLAY9uDq
 533/1SOY9NF97G8ZUVQq5vC5otJmmN4haDqDE7RF3UsNCXIZ7Esb27vIhqSQ7jOW
 HOoP3pSuEU968uigP1iGmKEzmkoyUxsePTDURK0HYrVN5g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2ncetu72-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 16 Dec 2025 06:56:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b22d590227so629198985a.1
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 22:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765868203; x=1766473003;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Qq0o/o5mq7+GYYh0mZ6YhmwiFC0Spd5O2WRdpBvbVAI=;
 b=REeJAHObcM/Po/xTG8hGha1dg1nBK/WWQlcXioaGSxI5YmQ/nCJDqdruuGNOw28MV/
 xN3/9y9z4aiap8UWl03fG+W1Lx8Av7KyCOvTfW+2qhHUIzgksDkLtjm6JnqVyROBssWq
 2aDnSVO23OgPnS28Xx0POxHveQkaq4F9lcLETrnGsqzJZ4kC0buPMat5pTR3AIVmu7l1
 xnnoK9aECJxIpH6bUpj2begR34aR5cdrk9siyw6rnhutEYHxzooMj9mwohcTNL0Hd6Ar
 t6Iex/8oPfgTG7qlohx4wet5n2/tU1cVwm/fAZQikYE7rd76JQLt8AgfvZv5C6I5b/UN
 o5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765868203; x=1766473003;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qq0o/o5mq7+GYYh0mZ6YhmwiFC0Spd5O2WRdpBvbVAI=;
 b=voPYv4SX97b3utntbfXOqWcJGaeO737CDFwqAW/IJuuxCryzwCVFwG01yLOtdB0IeE
 Ht08V4NTETcTbohlGdmf3GHmeBYZ0bMHtwoemWv07weGqooA4IUXq4NuwgdOi7KTOvB8
 6mvUo4CHpyh+F274KAjz3dCrB+y3rT/NgGO2KVETqNV6AMernXgPF6HRXA+cxwVyPkKv
 4eunGw4bQPZhbOWJnXJsOC+BP1wxCgk2ENsbWy1LgA98g7JcaJjRHhPHgaVA/7DFzNME
 134YGWhsyhuMKQIdfuf5lwludxCmClG337cVTq0X+QOea0rJzGM4Vyhew4kCKHsmffBb
 LmSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgtFYpv85CWO+LlcwViRhdClXKciUZ4FQiPagjguzJl4hhFkZmVe5Tviv95bbax4stt/9WOsQGzao=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFXwX9Aikpdtl2i9VWxkqM0D6J7zhCz5X/UIu88nN4y7ZjdGZ+
 Vz7PgWxJRs5Eg+4EHqj6HMSlJuMBUc4zBtbfiKS9p9z+0Z+4ACKC4RCHUp1z2vsVlWS7GPLLm4I
 qYDYOnsmKU1lGDtXV2uueq2i1tU0rfk9jB7kkwiEaL5bXM1Sa0tI0MadePzspiMEhjYVN3Gk=
X-Gm-Gg: AY/fxX6HHbs8MIPjqmG+JfyBGAt32KEOdgJzVqyDcBVC5/hTTCeD4Ckp41A0HFiLuZV
 FuIOZfS1fXHqji87APh/HExDelGZothYrfRR4aIpqVXB/MbTHP8zNwWfXwe03hDx9GCx/O3MsRU
 UaSTAoKlK+J6Lu66AXS9hROmQsz2TUQFw48Bt3ArK6uWOYOHC6ANDksRGg/GjeItlp7dudtN5pB
 MaMverXfqIY13abB93fP0x6WLCq2WChy2guGm9tYvVDY3VvGmO+aYkJhICez/CGEdZ8VJyx1qdZ
 nJPuCFkoY4WJ5Lynw65Gkka2qQjgUlz4nvA4SorsmDDSuT4bAUdzWmQloE3aMElE/VIY7qunZAh
 mqvx2CqRuZ2uexDTl5p7CCffz3Ojg3UY1xXgbxSl8INPinMDrmcYkJlypg9Vvr5WSsZZGRqo=
X-Received: by 2002:a05:620a:472c:b0:8b2:e469:39e8 with SMTP id
 af79cd13be357-8bb3a24892amr1820305585a.42.1765868203464; 
 Mon, 15 Dec 2025 22:56:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2K7PBJaFBU9kaEhxjqCZE/yPyO7uDfeLt4ijLUUf+oDfLGzKbgQUNi501dluGkE3z4Y2BZg==
X-Received: by 2002:a05:620a:472c:b0:8b2:e469:39e8 with SMTP id
 af79cd13be357-8bb3a24892amr1820303485a.42.1765868203010; 
 Mon, 15 Dec 2025 22:56:43 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8be31c75b45sm123526485a.52.2025.12.15.22.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 22:56:42 -0800 (PST)
Date: Tue, 16 Dec 2025 14:56:31 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 yongxing.mou@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com
Subject: Re: [PATCH v3 10/11] drm/msm/dpu: Refactor SSPP to compatible DPU
 13.0.0
Message-ID: <aUECnz+INNuLjHR6@yuanjiey.ap.qualcomm.com>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
 <20251215083854.577-11-yuanjie.yang@oss.qualcomm.com>
 <pzwgxqdlpmrbylguvzwypry3fix6wi7kxu3jlv3yzdtb3unnrf@wfzvuhvhmue5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pzwgxqdlpmrbylguvzwypry3fix6wi7kxu3jlv3yzdtb3unnrf@wfzvuhvhmue5>
X-Proofpoint-ORIG-GUID: MF9brKJjwgXSh0QxN7JjvtNAALjA_2iI
X-Proofpoint-GUID: MF9brKJjwgXSh0QxN7JjvtNAALjA_2iI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA1NiBTYWx0ZWRfX5UwVtXiydWvz
 YQcgDRtLoXy4oSs4wNt9PPrGkNC7rlpPtMlcFUfX0kZP4PJlc/n3QvstEAyF4FQS72GjNJlqLbP
 FpaGmyzNCO1NGjAN1MWV2FkPI7L/aEhJX8HZP3AwF2B30bTXBZUbykWOnxXxB2cddj3wKBpvtQX
 nYCjAeDCVb+FmXcqn6JrJxDIcW2b0BR3WVsGcs1q9bt9ombUTUe4a8uzKYzZQyi+ku5+fzAyIYR
 hj6WOHb/j4VT3lnv0z1JT3xWuc6dQ34z61HcvsgH0kBrNQAF8C7ZReRgcMcpU8SOjhahXccjb6B
 Pqn+zhg215A6lzg69mMuUFFlQ322+28wkbcDuu8io1B/FUFlsFca5vGoT+rhuUZrtoXDhPrFWXY
 JccCYObIN5qidSEyqRhOVNVpqlIfhQ==
X-Authority-Analysis: v=2.4 cv=XJU9iAhE c=1 sm=1 tr=0 ts=694102ac cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=PnxoWNhBm_jaqvFsFIIA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512160056
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

On Mon, Dec 15, 2025 at 10:08:22PM +0200, Dmitry Baryshkov wrote:
> On Mon, Dec 15, 2025 at 04:38:53PM +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
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
> 
> We've fixed the order of the interrupts patch. Now you are adding SSPP
> customization for 13.x _after_ adding the first 13.x support. Is that
> supposed to work?

Yes, will reorganize order.

 
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  15 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 155 ++++++++++--------
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  52 ++++++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  18 ++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |  17 +-
> >  6 files changed, 191 insertions(+), 69 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >  		switch (ctx->ubwc->ubwc_enc_version) {
> >  		case UBWC_1_0:
> >  			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> > -			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
> > -					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
> > -					BIT(8) |
> > -					(ctx->ubwc->highest_bank_bit << 4));
> > +			DPU_REG_WRITE(c, ubwc_ctrl_off,
> > +				      fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
> > +				      BIT(8) |
> > +				     (ctx->ubwc->highest_bank_bit << 4));
> 
> I have asked to drop unrelated changes. You didn't. Why? You are
> changing whitespaces for no reason. It's just a noise which hides the
> actual change here.

here ubwc reg layout change in DPU 13.

ubwc_ctrl_off
veriosn < 13 
reg: SSPP_UBWC_STATIC_CTRL
verison >= 13 
reg: SSPP_REC_UBWC_STATIC_CTRL

So I do some fix.

> >  			break;
> >  		case UBWC_2_0:
> >  			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> > -			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
> > -					fast_clear | (ctx->ubwc->ubwc_swizzle) |
> > -					(ctx->ubwc->highest_bank_bit << 4));
> > +			DPU_REG_WRITE(c, ubwc_ctrl_off,
> > +				      fast_clear | (ctx->ubwc->ubwc_swizzle) |
> > +				     (ctx->ubwc->highest_bank_bit << 4));
> >  			break;
> >  		case UBWC_3_0:
> > -			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
> > -					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
> > -					(ctx->ubwc->highest_bank_bit << 4));
> > +			DPU_REG_WRITE(c, ubwc_ctrl_off,
> > +				      BIT(30) | (ctx->ubwc->ubwc_swizzle) |
> > +				     (ctx->ubwc->highest_bank_bit << 4));
> >  			break;
> >  		case UBWC_4_0:
> > -			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
> > -					MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
> > +			DPU_REG_WRITE(c, ubwc_ctrl_off,
> > +				      MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
> >  			break;
> >  		}
> >  	}
> > @@ -313,19 +337,18 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
> >  
> >  	/* update scaler opmode, if appropriate */
> >  	if (test_bit(DPU_SSPP_CSC, &ctx->cap->features))
> > -		_sspp_setup_opmode(ctx, VIG_OP_CSC_EN | VIG_OP_CSC_SRC_DATAFMT,
> > -			MSM_FORMAT_IS_YUV(fmt));
> > +		dpu_hw_sspp_setup_opmode(ctx, VIG_OP_CSC_EN | VIG_OP_CSC_SRC_DATAFMT,
> > +					 MSM_FORMAT_IS_YUV(fmt));
> >  	else if (test_bit(DPU_SSPP_CSC_10BIT, &ctx->cap->features))
> > -		_sspp_setup_csc10_opmode(ctx,
> > -			VIG_CSC_10_EN | VIG_CSC_10_SRC_DATAFMT,
> > -			MSM_FORMAT_IS_YUV(fmt));
> > +		dpu_hw_sspp_setup_csc10_opmode(ctx,
> > +					       VIG_CSC_10_EN | VIG_CSC_10_SRC_DATAFMT,
> > +					       MSM_FORMAT_IS_YUV(fmt));
> 
> Again, useless whitespace changes.
checkpatch.pl says here is alignment issuse, so I do this fix.

> >  
> >  	DPU_REG_WRITE(c, format_off, src_format);
> >  	DPU_REG_WRITE(c, unpack_pat_off, unpack);
> >  	DPU_REG_WRITE(c, op_mode_off, opmode);
> > -
> 
> Why?

yes, will drop "-" diff.

> >  	/* clear previous UBWC error */
> > -	DPU_REG_WRITE(c, SSPP_UBWC_ERROR_STATUS, BIT(31));
> > +	DPU_REG_WRITE(c, ubwc_err_off, BIT(31));
> >  }
> >  
> >  static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
> > @@ -385,9 +408,9 @@ static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
> >  			tot_req_pixels[3]);
> >  }
> >  
> > -static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
> > -		struct dpu_hw_scaler3_cfg *scaler3_cfg,
> > -		const struct msm_format *format)
> > +void dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
> > +			       struct dpu_hw_scaler3_cfg *scaler3_cfg,
> > +			       const struct msm_format *format)
> 
> And here...
checkpatch.pl says here is alignment issuse, so I do this fix.



Thanks,
Yuanjie
 
> -- 
> With best wishes
> Dmitry
