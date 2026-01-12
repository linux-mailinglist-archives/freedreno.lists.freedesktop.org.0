Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F94ED10A77
	for <lists+freedreno@lfdr.de>; Mon, 12 Jan 2026 06:52:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3C910E041;
	Mon, 12 Jan 2026 05:51:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="T58iTMoW";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VGQ7u/gE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F318410E041
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 05:51:58 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60BNT6fR263654
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 05:51:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Td6ocBeHnz0kcfIs1Fr0o+wo
 3hzHfbfDLUrMEyzcrBY=; b=T58iTMoWkjRpa2aSIJqwdm/7/9OP3vMOlwwNJIRS
 +iSPQ/HgJx/tfVEwkGowLd2eHckrTlrKx28cmsDcNcj11RV0nBs80Xw3+1A1mm/P
 GRdRXaGJnvh5hPamxEXtwmyPkxUsPIAZ+vIAgnJ/peaAiZJMMz8SPYt0vVt20Szn
 5Mg8lkcMSt/mm9Vw4RgfD049aRktnD9lberbvNku4bGLfyycuO81TN1XCZfmRJLn
 IXtT07Ip0zoIgdps8mr80VUIc6r+0cBpIyRIZvmtwPmy+lhCrGW/mjE82JMUFkkK
 mq/0gfJxIwytEMk/HDzCE2WFhXvYHVbFbhd7T99KEam6lg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bm8kysqcm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 05:51:57 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8804b991976so157865716d6.2
 for <freedreno@lists.freedesktop.org>; Sun, 11 Jan 2026 21:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768197117; x=1768801917;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Td6ocBeHnz0kcfIs1Fr0o+wo3hzHfbfDLUrMEyzcrBY=;
 b=VGQ7u/gEc2ArJkww1f6TRuLr0n8xi//oQDP55FwugqZhotq0jlJt5KJ9zljGD7E0Vq
 xSfFJGU/ar2Hy9QfbvztiBMatqdw6bSVmuZDTA5CoG6XL4kmFFAXe3VzP/iY6zBOpxfs
 8dEYicqQGCsuvgImqxKYJUsad2wYwvSjBL8HiLFLlucZ02kGY2hhl0xBss6edPYwLikT
 BWZsrHKh4VQ7HfrO1Gs8bBpt4YjhstCtPOb7uUdhIalbnKCUve02lZFAMKZyBXDzzd3l
 geYmlqCBezjetp6HOoN7t9Ygp3YKBTWK8ZWiWsda3iXbWm6STQpyQcY8I3UL/N9I9K5C
 V97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768197117; x=1768801917;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Td6ocBeHnz0kcfIs1Fr0o+wo3hzHfbfDLUrMEyzcrBY=;
 b=LssKT0vWeXs0i/R759gNf7t7LzvhDS9yJz2lwQs+FVOFcIajGuJK/gkYXlHHtxN3J2
 aeXBNJnZVPTz/cHqhW11c4/jWM4sviu1yxfZWhp+C0H/5pEPzoE4+6ynmbuVOabNJoRO
 xfLMBziFwvCQFJy/eAdammCQgOK+Gqtl3hnG5Qc7hJ4cswsOAH02A0Sgq7EGoTaN50IZ
 CzjWewH/y8xDn2AVq8NdjU4vFP+K/qJlxrkCa5e5VOTFzDtoHAp8lMbw8WOIy86VpC03
 xH5kEBJZDZ+UNg6D/fOOSV4YpXlybgC5Xb2AyOGusbmtwA7u1/k5XG9OeYU/2XFkcL/S
 FV1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2bOsIbnHkaOaxCZAk4rMVvRISVn1ytvBhyR5YmrRWYeqHlr3tBQS552zqxzyEGo9JiX+xJbN763M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4ezg7gs1SP4BASVRk+zGxbW3186qxPa2Q91v84Rc1BFH6Dtwu
 KNZNj7VLPPbnwul9g8dLOckRX7WponADLfJ6nJw3cTrw4QvlqVnLEdnFi/HTYSHlTh506SHetec
 0DlagYTJRpb1WqGgl3y3KreU2Z5YM6CWvsxFohhyYgP3/5v/JVJa0YKCEanQh5fj2+WSU/3Y=
X-Gm-Gg: AY/fxX5xQDcuvp4KDSmhlolC7UDylIQjR1AjU3UBpe+fZp++JJWC6byk51o0aRT6MSc
 sCpHjLSJEygNpI9SpG+1ATEa+GjS88v+eCgzPTwkvy0HGG8WruKhknpIdfZoM5VrR3Dhu/n1AwV
 zl8JpQkQxQgKjgjFweq+Z7/jED1r4HTH6P0MeOX47ZRAiq+QNhu961pUuv3KMfhLLh54e/taKA8
 6liHMhspg1Hd8PZvuggUmigcPjL4g5hcO5NqfFBsUVd8a1fB4s0/y9RiWvRmcay5Kb0n5eYtbCE
 2QlSWAItOFbYV71dN8SKOTdRPU1RvvF3KbQJh3Pb3iGh1Q9URDgePxDxkW5o0o/o0nS3oyn5VeC
 6yhGXUpajGeKVyXuDK3Rw+v5HbFOH1wNGgVChEcSMVjfAIXXOPWNuiSeFblyn6yMdcki74t8=
X-Received: by 2002:a05:6214:498f:b0:88a:4452:750b with SMTP id
 6a1803df08f44-890842d8089mr231498756d6.60.1768197117125; 
 Sun, 11 Jan 2026 21:51:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMwmKE+BswERgCS/LJ0lJR4KnAfJVfiurAyj/wNOuhWJpyqEv6OKbBkeQCT6o36SNFMxdxIw==
X-Received: by 2002:a05:6214:498f:b0:88a:4452:750b with SMTP id
 6a1803df08f44-890842d8089mr231498566d6.60.1768197116652; 
 Sun, 11 Jan 2026 21:51:56 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8907725ffc7sm129678696d6.44.2026.01.11.21.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jan 2026 21:51:56 -0800 (PST)
Date: Mon, 12 Jan 2026 13:51:46 +0800
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
Subject: Re: [PATCH v5 10/12] drm/msm/dpu: Add Kaanapali SSPP sub-block support
Message-ID: <aWSL8gAJllBMnA5S@yuanjiey.ap.qualcomm.com>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
 <20260108085659.790-11-yuanjie.yang@oss.qualcomm.com>
 <k2orlbxktyqhuuoievurde5vglpbx2qqhkbmnasfnefax6p4tv@7hhmnyomtxyy>
 <aWBpEIHLtmCyZ5C8@yuanjiey.ap.qualcomm.com>
 <wgx4q3f4ktpoyq4u7rrquy7rs66hwidpr7dfxvw74w2xf53toe@kh3qy674des2>
 <aWCXOX+OKvWsqzNM@yuanjiey.ap.qualcomm.com>
 <bqwfbvjq7lmuz6ggrtcsq3hvxrvtfznxrt3l4cjr7lwlzvmtfy@6wtnkgefkpck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bqwfbvjq7lmuz6ggrtcsq3hvxrvtfznxrt3l4cjr7lwlzvmtfy@6wtnkgefkpck>
X-Proofpoint-GUID: 185q9rviy7Pn-enSjr3jOjCRkT_DqB-z
X-Authority-Analysis: v=2.4 cv=ZuDg6t7G c=1 sm=1 tr=0 ts=69648bfd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XksDqd45YQGufXC9n9wA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 185q9rviy7Pn-enSjr3jOjCRkT_DqB-z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA0NCBTYWx0ZWRfX5WONjfB9eoOh
 3p4WVh3Hwuf0eFVesyxG44JhJeh1C3KSrjKTlptgoQPtpE1y7r0+Xahpv7eUvwx0BJmdo9wA0kF
 XAIa7+pCJnZvBZiGnhzhsHh7gvxpwwwL3kiot7EauR8aOEJH/lXhsLuEPsFQkItAG8VyDSG2kck
 JelMbT4k4+UOfVb6WBwOK0JFkxyPR7Nnj2BYirC+VLNA/pVfL03iWaU3XKF439/2j2jPPt3btu9
 ZcpjFHt8X36pQBV8UGNGkLu7ogBY+1/4hdq8qmR6Waz1J5pZsPEMu86ENfuuJJafXILcpEbLYzt
 6yu5dfOpuAh5AEInXk6LDPVqoC1bTBrCtC4rbKglq0VsfYP+NSYJkeOWc5vB1u8Kv41xvTiU1ig
 BzvbtuxInlKN41r8LgxyUxgFPpD+9RtADwcj3mDxBAECtgzA//bFT3OyWCUSqGYg/pk3SeAwiLO
 ZqCr98SnLfxG5ah+mmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120044
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

On Sun, Jan 11, 2026 at 04:19:49AM +0200, Dmitry Baryshkov wrote:
> On Fri, Jan 09, 2026 at 01:50:49PM +0800, yuanjiey wrote:
> > On Fri, Jan 09, 2026 at 05:25:26AM +0200, Dmitry Baryshkov wrote:
> > > On Fri, Jan 09, 2026 at 10:33:52AM +0800, yuanjiey wrote:
> > > > On Thu, Jan 08, 2026 at 03:46:18PM +0200, Dmitry Baryshkov wrote:
> > > > > On Thu, Jan 08, 2026 at 04:56:57PM +0800, yuanjie yang wrote:
> > > > > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > > > 
> > > > > > Add support for Kaanapali platform SSPP sub-blocks, which
> > > > > > introduce structural changes including register additions,
> > > > > > removals, and relocations. Add the new common and rectangle
> > > > > > blocks, and update register definitions and handling to
> > > > > > ensure compatibility with DPU v13.0.
> > > > > > 
> > > > > > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/msm/Makefile                  |   1 +
> > > > > >  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  14 +
> > > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  14 +-
> > > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   4 +
> > > > > >  .../gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c   | 321 ++++++++++++++++++
> > > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  18 +
> > > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 +
> > > > > >  7 files changed, 371 insertions(+), 4 deletions(-)
> > > > > >  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
> > > 
> > > >  
> > > > > > +		c->ops.setup_sourceaddress = dpu_hw_sspp_setup_sourceaddress_v13;
> > > > > > +		c->ops.setup_solidfill = dpu_hw_sspp_setup_solidfill_v13;
> > > > > > +		c->ops.setup_pe = dpu_hw_sspp_setup_pe_config_v13;
> > > > > > +
> > > > > 
> > > > > >  /* QOS_QOS_CTRL */
> > > > > >  #define QOS_QOS_CTRL_DANGER_SAFE_EN       BIT(0)
> > > > > >  #define QOS_QOS_CTRL_DANGER_VBLANK_MASK   GENMASK(5, 4)
> > > > > > @@ -475,6 +482,17 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
> > > > > >  		      cfg->danger_safe_en ? QOS_QOS_CTRL_DANGER_SAFE_EN : 0);
> > > > > >  }
> > > > > >  
> > > > > > +void _dpu_hw_setup_qos_lut_v13(struct dpu_hw_blk_reg_map *c,
> > > > > > +			       const struct dpu_hw_qos_cfg *cfg)
> > > > > 
> > > > > Will it be shared with other blocks (DS, WB)?
> > > > 
> > > > yes, _dpu_hw_setup_qos_lut_v13 will be used in WB, in function dpu_hw_wb_setup_qos_lut_v13.
> > > > 
> > > > So maybe I should drop '_' rename _dpu_hw_setup_qos_lut_v13 --> dpu_hw_setup_qos_lut_v13 ?
> > > 
> > > Yes, please. As you are going to resend the series, could you please
> > > also remove the function from the header?
> > 
> > Sure. But here a little confused.
> > 
> > Do you mean I should delete _dpu_hw_setup_qos_lut_v13 in header,
> > Or I should rename _dpu_hw_setup_qos_lut_v13 in header to dpu_hw_setup_qos_lut_v13.
> > 
> > _dpu_hw_setup_qos_lut_v13 is used in dpu_hw_sspp_v13.c and dpu_hw_wb.c, so I don't think
> > it can be removed from header.
> > 
> > Could you please help me clarify this comment?
> 
> Move it to dpu_hw_util.c

Yes, will do move _dpu_hw_setup_qos_lut_v13 definition to dpu_hw_util.c.
 

Thanks,
Yunajie

> > 
> > Thanks,
> > Yuanjie
> >  
> > > -- 
> > > With best wishes
> > > Dmitry
> 
> -- 
> With best wishes
> Dmitry
