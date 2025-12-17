Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7D4CC5CF4
	for <lists+freedreno@lfdr.de>; Wed, 17 Dec 2025 03:46:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E7310EA16;
	Wed, 17 Dec 2025 02:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kkP9Y3yC";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="isqMz4T+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71D1A10EA10
 for <freedreno@lists.freedesktop.org>; Wed, 17 Dec 2025 02:46:05 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BGMQxQU273900
 for <freedreno@lists.freedesktop.org>; Wed, 17 Dec 2025 02:46:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=JCJBPzyRlhs0ukky8nnWNxDG
 T3jIQ2bJUvRtWHrXAZA=; b=kkP9Y3yCoFi7+UDQPn6FBzxoy7INU9c/w6Tsuzjf
 OAcaisEwIdxxWr+wUSL07+/BCTYYlYNb3uAiFZ2TCjZlNVNPOEDJ5UOs/Y24ulKN
 Jj1LxAPNDoF82HY4H8VcQTl1Uz6r5pGeFModVu7iYYEBd50xbLBWhd7u25A/asN4
 5EHKl/5ZDqH9LFjo1diyEn/awSDui1/VDScTcgma+oTs1T9Jq+fvs+1jOlLbTUtz
 QahlZurh9Tj0K3s/GyxrSZuK8ezTd3qYtonCUyNQqx0YPbrSUckft+Oc5VGZ+vtl
 K3bJw/k3vz1FXHIZP16CAK4soXqLSLVUopwUlSGvgPTLww==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fj1rnck-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 17 Dec 2025 02:46:04 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-88a2f8e7d8dso82725896d6.1
 for <freedreno@lists.freedesktop.org>; Tue, 16 Dec 2025 18:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765939564; x=1766544364;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JCJBPzyRlhs0ukky8nnWNxDGT3jIQ2bJUvRtWHrXAZA=;
 b=isqMz4T+GxUQnh6f3W7lIsbstTwQrQsv5rcN0XBtL25Y28NkV1/y3g4pZCqA7WeHuv
 1KJRjniITd/KavPrcWu5SDU+3MswQOKpH6E6NH6uYZn7g0Z5af7UwIno/32Bv6Ype0b/
 jDralnTFlt6Gj/yjUVDd70OMirCs6HOWHVetispGck6Puy07NlOYkPz3EhzD83PoimyR
 CnotYRwRHtNSGWMC3bKb9aX3mzpPsoD4dhJWpLMUGhXB/xDHXqi3+Dq3oGvncwBbsxtP
 7MX55ySq60gDyHpjYPryIpBp5XmjscEm0SAzpiwAVKjYI0gi1UIWJZOUtF7C+9taHKmw
 Ponw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765939564; x=1766544364;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JCJBPzyRlhs0ukky8nnWNxDGT3jIQ2bJUvRtWHrXAZA=;
 b=cL+PPn7x8QnTDreHX1GrLLh7sxArFNyh7Pd4p2sTJqxjwVSmhiPcdLMw59L9b4yPvc
 XibiVlDCwrlmOo1HPZuNwZnfqZ2X0A/zrgZkHIIbUvtiHP4ib6eT85VLsuQbMVJnNvtZ
 SU4NxJMA+bWjJuTq6f6D7trZAkF1dCZ8GWc2SC7EhZRxI/XZqgyNKPTsbh9b3HBNWU6I
 ROrsVVy/v0AOnOxEhCDUi44iuhOl1JFVyD2MjdLTepOW4EKafDBlnEwPFXr5z+QJS9e6
 TDECxj+Vej3FOFQjz1lGYtlFAf7F7f6BoRzbwiTptbFZWLAOQkx/n2tzSwOh5m+wgwtK
 muJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXIL2e2dmF0I7sxQ+5ocFbSJDHHFzdvl/P8EteGczAk09Bmpd3YQp4vqVVdBvwm2zA0I01hfkXfXw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHUxtjJk30zak8BtkExtx/FC7aqrnDIo+O8fA3EfyCX4aMso8O
 inMoxL4EoSQ3to0cZJ17lzmOGkGy59mE7SFmznnb5vt8G3cgjnCSuOoJDwynvEiwsaqdOIJwJ4Z
 jsMtH4FGEeFXm8JMo3T/4zSjkZ+hOynH82Hw5eWseNp6SAXkATKzHk5FXLqSPvLSPc6m1QLI=
X-Gm-Gg: AY/fxX6uAq8ounhUwkTytP7JbMsZsvkkyu8S3hfCt6aYihNKviflhJMdi4vCIzKoub/
 po2joYPruyyRJhEUGRJRVDaioONbWDD4iW0Re384BTrWka24leZPkpj6OQGcyA2rzj04l4JZ0Qx
 dSgs3UCUJAA9XsnkzKvENwQepP5+ndkFPw4+cE7Z3SDRScD7LVhg5yaKxnvRopTsTSPiwPaz+/n
 AO55xJKWF/Y7uhI14b34T4+d8kHj8xwdWlH99bby42tX3QnI/fyixKSzeVJhQheba05wKLM1CK0
 +87bFtvpQh6CfT/5v62lvWsEH324tT18ylHOlmEdbi5uGb4UKJ2ejzRB3TWXstjppAzNcmZAXTA
 FADJqiaKkaqQxGGYpX7JRtxi8te0GuwDHcyOVfJ0y+mWLgTLJw075Btg1q1mzhw38/T5wS4c=
X-Received: by 2002:a05:6214:5b87:b0:888:82c3:dfc0 with SMTP id
 6a1803df08f44-88882c3e67cmr227694966d6.55.1765939563547; 
 Tue, 16 Dec 2025 18:46:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGx1RaDoBtJw9fMmc0Xmr4th/lJOfvqaul2PsNrWDcut+ChvzvkgYHcb05lGbK5/M73moqytA==
X-Received: by 2002:a05:6214:5b87:b0:888:82c3:dfc0 with SMTP id
 6a1803df08f44-88882c3e67cmr227694546d6.55.1765939562816; 
 Tue, 16 Dec 2025 18:46:02 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8899ea36210sm85899146d6.27.2025.12.16.18.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 18:46:01 -0800 (PST)
Date: Wed, 17 Dec 2025 10:45:50 +0800
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
Message-ID: <aUIZXiL+JY27phny@yuanjiey.ap.qualcomm.com>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
 <20251215083854.577-11-yuanjie.yang@oss.qualcomm.com>
 <pzwgxqdlpmrbylguvzwypry3fix6wi7kxu3jlv3yzdtb3unnrf@wfzvuhvhmue5>
 <aUECnz+INNuLjHR6@yuanjiey.ap.qualcomm.com>
 <gljkq6jijsprelq7qmgai4g7mqlshezdx755n3ivbxjdf6uw73@dz3mkct7g3ry>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gljkq6jijsprelq7qmgai4g7mqlshezdx755n3ivbxjdf6uw73@dz3mkct7g3ry>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDAyMSBTYWx0ZWRfX797w7I7z+yri
 VmxscKK/C1Tw0h7SMoOIkc7piLV/MjpeqnGq0xzZbeQbifWswVoB53sQha518eNmC8dHo/buxKS
 qxTPMbr5xg9sSWg4JLT5T32T3Hg5IibbYDuiyHvtEUKa4zDu4H07N5SKMmjFYnADRY6PiCpjAex
 OVRkz5LU53XQnwHBdAt/mbyS8CZ3OXn0C2WYKf6M/wWtDzD0K8B8jfRVAE3IHsVYrSlZvAiMs4z
 T+bUmnHUJt2v7epD+/LysG6gOTkIL/pM0w64yuTfJEOPZjnYTodQf89XzPfo7rpcWcUDaNfXIgv
 4+oMCGyCfRLz1CpGLJY/gUz+HEIgP6hpy6p3sLVNEkD5i8FIYNizhxQa+6wIaUKVJ50c8kKd3rn
 yZFUJkmg5/aO1AtKHQWUx3vS685ZZA==
X-Proofpoint-ORIG-GUID: nxlgwoOrqTVtGgBi32gsQJv6urry_i1B
X-Proofpoint-GUID: nxlgwoOrqTVtGgBi32gsQJv6urry_i1B
X-Authority-Analysis: v=2.4 cv=edgwvrEH c=1 sm=1 tr=0 ts=6942196c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=tNEIORBzTMdH9SYpPiUA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170021
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

On Tue, Dec 16, 2025 at 04:22:32PM +0200, Dmitry Baryshkov wrote:
> On Tue, Dec 16, 2025 at 02:56:31PM +0800, yuanjiey wrote:
> > On Mon, Dec 15, 2025 at 10:08:22PM +0200, Dmitry Baryshkov wrote:
> > > On Mon, Dec 15, 2025 at 04:38:53PM +0800, yuanjie yang wrote:
> > > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > 
> > > > DPU version 13.0.0 introduces structural changes including
> > > > register additions, removals, and relocations.
> > > > 
> > > > Refactor SSPP-related code to be compatible with DPU 13.0.0
> > > > modifications.
> > > > 
> > > > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > ---
> > > 
> > > We've fixed the order of the interrupts patch. Now you are adding SSPP
> > > customization for 13.x _after_ adding the first 13.x support. Is that
> > > supposed to work?
> > 
> > Yes, will reorganize order.
> 
> And after comparing with v2, I'm really surprised. It was better before
> and then you changed the order of the patches. Why? You were asked to
> split it, but not to move it to the end.

I make the mistake.
Sure, I will keep the v2 patch order in next patch.
 
> > 
> >  
> > > >  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  15 +-
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 155 ++++++++++--------
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  52 ++++++
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  18 ++
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 +
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |  17 +-
> > > >  6 files changed, 191 insertions(+), 69 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > > >  		switch (ctx->ubwc->ubwc_enc_version) {
> > > >  		case UBWC_1_0:
> > > >  			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> > > > -			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
> > > > -					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
> > > > -					BIT(8) |
> > > > -					(ctx->ubwc->highest_bank_bit << 4));
> > > > +			DPU_REG_WRITE(c, ubwc_ctrl_off,
> > > > +				      fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
> > > > +				      BIT(8) |
> > > > +				     (ctx->ubwc->highest_bank_bit << 4));
> > > 
> > > I have asked to drop unrelated changes. You didn't. Why? You are
> > > changing whitespaces for no reason. It's just a noise which hides the
> > > actual change here.
> > 
> > here ubwc reg layout change in DPU 13.
> > 
> > ubwc_ctrl_off
> > veriosn < 13 
> > reg: SSPP_UBWC_STATIC_CTRL
> > verison >= 13 
> > reg: SSPP_REC_UBWC_STATIC_CTRL
> > 
> > So I do some fix.
> 
> What does it have to do with the whitespaces? Fix _one_ line.
get it, will drop unrelated whitespaces.

> > 
> > > >  			break;
> > > >  		case UBWC_2_0:
> > > >  			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> > > > -			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
> > > > -					fast_clear | (ctx->ubwc->ubwc_swizzle) |
> > > > -					(ctx->ubwc->highest_bank_bit << 4));
> > > > +			DPU_REG_WRITE(c, ubwc_ctrl_off,
> > > > +				      fast_clear | (ctx->ubwc->ubwc_swizzle) |
> > > > +				     (ctx->ubwc->highest_bank_bit << 4));
> > > >  			break;
> > > >  		case UBWC_3_0:
> > > > -			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
> > > > -					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
> > > > -					(ctx->ubwc->highest_bank_bit << 4));
> > > > +			DPU_REG_WRITE(c, ubwc_ctrl_off,
> > > > +				      BIT(30) | (ctx->ubwc->ubwc_swizzle) |
> > > > +				     (ctx->ubwc->highest_bank_bit << 4));
> > > >  			break;
> > > >  		case UBWC_4_0:
> > > > -			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
> > > > -					MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
> > > > +			DPU_REG_WRITE(c, ubwc_ctrl_off,
> > > > +				      MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
> > > >  			break;
> > > >  		}
> > > >  	}
> > > > @@ -313,19 +337,18 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
> > > >  
> > > >  	/* update scaler opmode, if appropriate */
> > > >  	if (test_bit(DPU_SSPP_CSC, &ctx->cap->features))
> > > > -		_sspp_setup_opmode(ctx, VIG_OP_CSC_EN | VIG_OP_CSC_SRC_DATAFMT,
> > > > -			MSM_FORMAT_IS_YUV(fmt));
> > > > +		dpu_hw_sspp_setup_opmode(ctx, VIG_OP_CSC_EN | VIG_OP_CSC_SRC_DATAFMT,
> > > > +					 MSM_FORMAT_IS_YUV(fmt));
> > > >  	else if (test_bit(DPU_SSPP_CSC_10BIT, &ctx->cap->features))
> > > > -		_sspp_setup_csc10_opmode(ctx,
> > > > -			VIG_CSC_10_EN | VIG_CSC_10_SRC_DATAFMT,
> > > > -			MSM_FORMAT_IS_YUV(fmt));
> > > > +		dpu_hw_sspp_setup_csc10_opmode(ctx,
> > > > +					       VIG_CSC_10_EN | VIG_CSC_10_SRC_DATAFMT,
> > > > +					       MSM_FORMAT_IS_YUV(fmt));
> > > 
> > > Again, useless whitespace changes.
> > checkpatch.pl says here is alignment issuse, so I do this fix.
> 
> The issue was present before your patch. If you want to fix it, fix it
> in the separate patch or ignore it.
get it, will drop unrelated whitespaces.

> > 
> > > >  
> > > >  	DPU_REG_WRITE(c, format_off, src_format);
> > > >  	DPU_REG_WRITE(c, unpack_pat_off, unpack);
> > > >  	DPU_REG_WRITE(c, op_mode_off, opmode);
> > > > -
> > > 
> > > Why?
> > 
> > yes, will drop "-" diff.
> > 
> > > >  	/* clear previous UBWC error */
> > > > -	DPU_REG_WRITE(c, SSPP_UBWC_ERROR_STATUS, BIT(31));
> > > > +	DPU_REG_WRITE(c, ubwc_err_off, BIT(31));
> > > >  }
> > > >  
> > > >  static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
> > > > @@ -385,9 +408,9 @@ static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
> > > >  			tot_req_pixels[3]);
> > > >  }
> > > >  
> > > > -static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
> > > > -		struct dpu_hw_scaler3_cfg *scaler3_cfg,
> > > > -		const struct msm_format *format)
> > > > +void dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
> > > > +			       struct dpu_hw_scaler3_cfg *scaler3_cfg,
> > > > +			       const struct msm_format *format)
> > > 
> > > And here...
> > checkpatch.pl says here is alignment issuse, so I do this fix.
> 
> And I'm asking you to don't do it. Don't clutter the patch with
> unrelated changes (and whitespace / alignment changes are generally
> unrelated).
>
> -- 
> With best wishes
> Dmitry

Thanks,
Yuanjie

