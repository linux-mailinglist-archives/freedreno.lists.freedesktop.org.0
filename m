Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A564AD06DC2
	for <lists+freedreno@lfdr.de>; Fri, 09 Jan 2026 03:34:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD5C10E7DF;
	Fri,  9 Jan 2026 02:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PSX89Ts+";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ewy4h76/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71D6410E213
 for <freedreno@lists.freedesktop.org>; Fri,  9 Jan 2026 02:34:05 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 608HjxPV2706829
 for <freedreno@lists.freedesktop.org>; Fri, 9 Jan 2026 02:34:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=pjAzBejL8JL4/IEU54yimhls
 JPnHrnNM1tihLzjWhOg=; b=PSX89Ts+xSMLquA4sVNQHb8D4md0+wCHyXv2hmxZ
 2nspvD1wkB846keLafxbhfJY6PfiqpmYW0n870KkOfUcHTLb4PzFlewXZoAqzRu5
 qdypCCcB69i830lVCMDpj++9waQGL0Hhl6tEfFxfIyszEah9VR/S0a6uYaSweDVx
 23sv/pT+xSMktGiZ5ZGHT3iyS7hz1b0XhTzFcLvHY/7I+6YJRJvKfhRAOvbS4ce+
 C1FOlTjN3OqqehOVpyverbwTzYSVbCXCcleCZsQyFtIFN4MFzn2+kjDsgW0RAVAp
 O36rIICbXTgp/4uZLcMq49YFdC/oJVfZYxcgVhrYaWq86A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj9hqtxnj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 09 Jan 2026 02:34:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b51db8ebd9so1199681885a.2
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jan 2026 18:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767926044; x=1768530844;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pjAzBejL8JL4/IEU54yimhlsJPnHrnNM1tihLzjWhOg=;
 b=Ewy4h76/dZUSV0i2mIJMJlCozRrdb3p39Bjcv39nPsXzR2twGI48C7srHHRE/bpl/h
 Glsu3p+hV8S/6zRSkCEJPnFfqaUAPwmGThBlh+1B0axoBrm1sJrrja5Vjhjufz9d2yAv
 sDR+jar2XLhYlIsX0XkBhz2F2tE8Y/iHdwr4udDm/CX3ZTrnqukuRQxgyV4sE3nCKCtb
 1vqQPBXl4S2TW25dgvoUQquoJ1sn5TUMguEBNNTRw/BTGgRzsxfSfuXHR6fQppubn6lc
 Rd2d0VJ+qwzOT8R47QlYLHxIThoKZcPyeWvdrFf8q5JWe7se5nL34K4GZjeCnLfwwH8i
 WnIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767926044; x=1768530844;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pjAzBejL8JL4/IEU54yimhlsJPnHrnNM1tihLzjWhOg=;
 b=DoneBUcl8aYnmYwsEWV2YoKYx3Hn5uRS96Oi5AYAjZKKiLsT7HZvfNHFroLSuLR+iG
 CH53YwDoDgyviyx8eVfaP2FyqVAVGzdGMMBYnDgl3Ujam4RLuJePjht6GiCBq49FOYmp
 6pbW3bSxM3kCAI+uxfYsk7HpXZFV08gR88H0wrfV5HyFkV3E2wcidB3+aOCjassVf1II
 MNOMiVektK09hq69+CW9lfhEAr/jBPKHG6RUoYxyr9yyGiRzVMsykn8TqcOs8pSfeGq5
 Z9VgvAUwtuqi1HZlt4NVF9DSgmiaE2KSC8XHsNlFVIXROPCVkjZFauen79+CKwRIg+Um
 ZIxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVimsTwoCHHxig6dyA0+U8zhnlENJ1GrICfWdpFfY9lUzLsdk9IsAUHNIcrQMFgWFGUjDn9X1Sdqas=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdqLH3N03edD4ymKJLBcZoa/KP0aHofQvGM08LypTaO+UhdH+u
 l5yv8QZpNJ7DknzTY3ghGCsLO8UtvRL656B+HOUjty7FrelaBIZIuARkOmGn9HYjwwNeEfdDSn4
 L6jaNfwl/JVOIcpUHdX3YgGP984qn0WFGLRjxxphaN0iq3/GoiZOGBumUp13zwHuPfRUzbbk=
X-Gm-Gg: AY/fxX4lUReiuxcRPASSEcPPVp8dYbpr651U8pocaPMuWJzg9PzYx+qMoxCkzfqhbRG
 s2w74abY0I1N/LucydPJ9xK13FerhUjh1hA9BDl7senaaCX3nAnRfVI3gcESFITnmgHJSFF+qIL
 bbEXYKih73un0FDCPZ6dgrLXagQG0p2Fqx2PNB1czucWRvcqt1V4WCss2AOIO2NVZZnSd4znm1I
 K4V5XPyo/+Qagsr5WaZkHUuXA5auOx9GAUveMGg4qCtuvV14sJIIJVUMnCHf/KHiPzJshPdYMlS
 ZmGnIMTP9mZ2uTF+IEiOl4KBNVa+2Y4HX+xQIA0kvws2ZEnJAbRkzC0pghp33IWTjuKTRXWKYdD
 YMOdQ56Tk4J/kTzJUUDczLyvTLagd4RwbKK8LiSYfJGW1Edq1kkbAqiddvAvxE65U35LdwUA=
X-Received: by 2002:a05:620a:690d:b0:861:119b:3052 with SMTP id
 af79cd13be357-8c3893f5aeamr1222804485a.51.1767926043867; 
 Thu, 08 Jan 2026 18:34:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENTUJZuyzQYyKEXuwN8Frzm1IG/sJYpeF6AXGlDy2+lmsKBcuMwUivs/WYg5LuI8xNKsyVkg==
X-Received: by 2002:a05:620a:690d:b0:861:119b:3052 with SMTP id
 af79cd13be357-8c3893f5aeamr1222800785a.51.1767926043408; 
 Thu, 08 Jan 2026 18:34:03 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c37f54427esm753223785a.48.2026.01.08.18.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 18:34:02 -0800 (PST)
Date: Fri, 9 Jan 2026 10:33:52 +0800
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
Message-ID: <aWBpEIHLtmCyZ5C8@yuanjiey.ap.qualcomm.com>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
 <20260108085659.790-11-yuanjie.yang@oss.qualcomm.com>
 <k2orlbxktyqhuuoievurde5vglpbx2qqhkbmnasfnefax6p4tv@7hhmnyomtxyy>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <k2orlbxktyqhuuoievurde5vglpbx2qqhkbmnasfnefax6p4tv@7hhmnyomtxyy>
X-Authority-Analysis: v=2.4 cv=GN8F0+NK c=1 sm=1 tr=0 ts=6960691c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Ry2Wfz2E4BY8SyJT9oIA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: P1Hc8RPuE3DKDFt9zDSoLyoDjOoiglNz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDAxNSBTYWx0ZWRfX7Tv74xEBbwEn
 8komigiZMoA/tIXQmSUM+xcJ500zKtxvlrRIhI7JNIrDVjjE7hRDRUhc6k6xkYa5OMqtS2eUXEF
 Wex4FAeCtneiA52SOT6XENmrrOOk064cndpwFpVlQOIVrw4mhGpyfS0/4lcjsdKI3wSb/lR2/dQ
 LUfC1x79HFdjrkOnGLJQO5OqdLjNzDeOgz571+ay1RYe04As9kwlQv6mEWSQ5M0hIkax71qN10R
 yloTLITFfQg3sCVCXzVtTKPqGTqbcjFMd7CQNyFmf94BdyvRVtpDUq9W+DWNrtQ4VHqb9ic+FNU
 /AJkUcEOEfHqtcnkSRA1ggU9BRBGJbA32CQBS4H2Ae0DSf/K7DwMRj+TxF2M6Sw7QRGz8zphfjO
 V9BQLqp9V5za+RO6oGiqWWcDBHdUTXfJT9GlM5NHZCMTxsntSKMenskPpiGJ/0uyjCq/MggaJTU
 vnUOR+shaivEnD/ID8w==
X-Proofpoint-ORIG-GUID: P1Hc8RPuE3DKDFt9zDSoLyoDjOoiglNz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_01,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090015
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

On Thu, Jan 08, 2026 at 03:46:18PM +0200, Dmitry Baryshkov wrote:
> On Thu, Jan 08, 2026 at 04:56:57PM +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > Add support for Kaanapali platform SSPP sub-blocks, which
> > introduce structural changes including register additions,
> > removals, and relocations. Add the new common and rectangle
> > blocks, and update register definitions and handling to
> > ensure compatibility with DPU v13.0.
> > 
> > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/Makefile                  |   1 +
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  14 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  14 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   4 +
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c   | 321 ++++++++++++++++++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  18 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 +
> >  7 files changed, 371 insertions(+), 4 deletions(-)
> >  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
> > 
> 
> > +
> > +void dpu_hw_sspp_init_v13(struct dpu_hw_sspp *c,
> > +			  unsigned long features, const struct dpu_mdss_version *mdss_rev)
> > +{
> > +		c->ops.setup_format = dpu_hw_sspp_setup_format_v13;
> > +		c->ops.setup_rects = dpu_hw_sspp_setup_rects_v13;
> 
> Wrong indentation.

will fix in next patch.

 
> > +		c->ops.setup_sourceaddress = dpu_hw_sspp_setup_sourceaddress_v13;
> > +		c->ops.setup_solidfill = dpu_hw_sspp_setup_solidfill_v13;
> > +		c->ops.setup_pe = dpu_hw_sspp_setup_pe_config_v13;
> > +
> 
> >  /* QOS_QOS_CTRL */
> >  #define QOS_QOS_CTRL_DANGER_SAFE_EN       BIT(0)
> >  #define QOS_QOS_CTRL_DANGER_VBLANK_MASK   GENMASK(5, 4)
> > @@ -475,6 +482,17 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
> >  		      cfg->danger_safe_en ? QOS_QOS_CTRL_DANGER_SAFE_EN : 0);
> >  }
> >  
> > +void _dpu_hw_setup_qos_lut_v13(struct dpu_hw_blk_reg_map *c,
> > +			       const struct dpu_hw_qos_cfg *cfg)
> 
> Will it be shared with other blocks (DS, WB)?

yes, _dpu_hw_setup_qos_lut_v13 will be used in WB, in function dpu_hw_wb_setup_qos_lut_v13.

So maybe I should drop '_' rename _dpu_hw_setup_qos_lut_v13 --> dpu_hw_setup_qos_lut_v13 ?

Thanks,
Yuanjie

> > +{
> > +	DPU_REG_WRITE(c, SSPP_CMN_DANGER_LUT, cfg->danger_lut);
> > +	DPU_REG_WRITE(c, SSPP_CMN_SAFE_LUT, cfg->safe_lut);
> > +	DPU_REG_WRITE(c, SSPP_CMN_CREQ_LUT_0, cfg->creq_lut);
> > +	DPU_REG_WRITE(c, SSPP_CMN_CREQ_LUT_1, cfg->creq_lut >> 32);
> > +	DPU_REG_WRITE(c, SSPP_CMN_QOS_CTRL,
> > +		      cfg->danger_safe_en ? QOS_QOS_CTRL_DANGER_SAFE_EN : 0);
> > +}
> > +
> >  /*
> >   * note: Aside from encoders, input_sel should be set to 0x0 by default
> >   */
> 
> -- 
> With best wishes
> Dmitry
