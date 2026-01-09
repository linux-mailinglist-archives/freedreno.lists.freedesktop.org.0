Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A0BD073E3
	for <lists+freedreno@lfdr.de>; Fri, 09 Jan 2026 06:51:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB3010E173;
	Fri,  9 Jan 2026 05:51:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MNno0Ii+";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kv4E/SPO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E136A10E173
 for <freedreno@lists.freedesktop.org>; Fri,  9 Jan 2026 05:51:02 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6094Ylgn2706968
 for <freedreno@lists.freedesktop.org>; Fri, 9 Jan 2026 05:51:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=SZ+vI17AryCUc2LXtMN69ba7
 Hushzr3nEAs4KJ9v5tM=; b=MNno0Ii+xcFwzwgsp8WGG9nbwjtcdcUH76J+/08h
 uutwn97UCMCUBT17Bd+jCeXel4ioVCmvgysCsAKJUTo4a6CCwDGzhFzk3wFmML8b
 +n20P+FqUdhBkoYUvItzI8JCJwc2r6v6v8TMbBZ+sWtCkygiLDyyGcJ028d0TEpM
 1SZlIpI7g1SqOKk/2x59MmMGulB7jLTBzehaY8kfUXqf8bRja1z4Y0BfEg43c7zX
 BNwERg4VkfZ8fz/L259lYxbxcr5OLdUE2YBQRxzhdPaznWs/17qHv/K65//VeYPa
 N4v7ZhmQRuxJrtvub05RMl+dRKZ7lgBold/K5bEZaKonZg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj9hqucsk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 09 Jan 2026 05:51:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b6a9c80038so431020185a.2
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jan 2026 21:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767937861; x=1768542661;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SZ+vI17AryCUc2LXtMN69ba7Hushzr3nEAs4KJ9v5tM=;
 b=kv4E/SPOWXMYsWxaP0s6ixT5WlCe+69fwlsdggewriTgY1s9sCdBf/OhlGu6+ozsUx
 6blxp9Nt1uLh8O9rkCieJBeCa7s0OsCDbh2LA6oneljhzJ3vyuTtGRLT+1LJ+hcoKC4o
 JdYtO9FQlMp4Iqfwyv2cSXTcJiKoKrv+C/l08JPxdsGdEVbm7czNvl1w8Ho32Narcl41
 ElPHPi7ImLw6yk6QRjbYKADgpFVQ8F/LqQ26WdSW1tlzPAY8ymeA0PLkwT+v/7K8aIZO
 SDvY7iRGcZoKXiOMg8OMwq58ttZfae2gtng5Hd/dfd784sWpice1QokAjp8z4I9QvXpD
 1zlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767937861; x=1768542661;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SZ+vI17AryCUc2LXtMN69ba7Hushzr3nEAs4KJ9v5tM=;
 b=W7owx9vWqyim2yoUeZ7EdX8NYJoMiFdfFOUVEtR9Ip4WBMp28RqCc1B55PJ0la847T
 k2kgrDjPw597MGbGsT2W4GWc/mcfPI7earaKL66+zdyOT1YwtuZlGqP75h3mYN33CtIm
 SgHJvh9UxUJmHkwaYYfpXdj/eUFRKMu6SKBRiQi/K39RyVHE7DZvzMVRXTXx4GOe1t7K
 SDPVt/aukspUUoxGiZ89i373yRH0OtHty52wiUCw/4sf9DyDyoVZc56EVsobgX9GbssI
 yiBcx4dJ42kUuiFVUbCZmuOFmClceOJziba5Zdnd5MbVRtuebrTb/z6WKH5vgQLilbYi
 JcbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt6FKiAoYpMgc2zZEMYb2mVV+XlOTJDJjpiw92QZrtmCe8vh2sQ7hKpGLECZVIzQ92mguv7Kcp5go=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZWrmTddIzogp8tzBbdaOv3O6Zyu5Aw1vUcn/addaI0pumwAwM
 6WtwpXk0urvKhiiRK1EaiAPBoi8JTbM8GFK1tczlOEVlPLqwAprjVKEa2fSJqaygarE4i962/4U
 wwk06u2GASaqXy0XCiJ3JQdxyMOZkwAUgxV85sNSZ4nGT8rbDsLmcUn5kMmWeQd85lJxs6hKefj
 gEuCo=
X-Gm-Gg: AY/fxX4jmSwLY1ppditcvc05C601g0gDJw9o+ChUmttLnTpNnOyrWYp42FWboKIzhRr
 xibhnhWkbOmHlxPj/B7xfXTSQBayjXd8x1KG9tdtFNl7RPuzdz8OY+D5EkkezcBLSVc5sPykfru
 3gYmGKe55SgK58IJ3lc1+k5ppzxSyo//6Q8UaxhYKXlAB4857jCHYRrpM35pIgDAI1wqY3cTvDp
 fs2VNwwByJXoG6+FrkBvJuegPcUB21fDGVMeSSaiWOpjyRXDN4HLaiyAi9psGgTp8oQ/sRBWJBN
 ByEn3F6MKq6nL6SnB8HfdEMVjQOXsNcW+b7qn3kn8QO5layt577/kbqOZB9SgXgIhK5F3g7T9+x
 iBfNUYsV5++B3WOgjbssSEjpB7gCs6xcFTLQcNwVq7niiRQPoVz5ILmyrEi/Gj1ir5FxiI68=
X-Received: by 2002:a05:620a:7001:b0:8b2:2607:83d5 with SMTP id
 af79cd13be357-8c3893fa385mr1179355185a.75.1767937861138; 
 Thu, 08 Jan 2026 21:51:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNQP+z38zKgjcFwkfa/1G+ZNK+xmbjvdmPnRkKFboJurHGR+NtsX6o0sZ8QmOor5L8ELP7SA==
X-Received: by 2002:a05:620a:7001:b0:8b2:2607:83d5 with SMTP id
 af79cd13be357-8c3893fa385mr1179352285a.75.1767937860609; 
 Thu, 08 Jan 2026 21:51:00 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c37f4b8573sm729474385a.12.2026.01.08.21.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 21:51:00 -0800 (PST)
Date: Fri, 9 Jan 2026 13:50:49 +0800
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
Message-ID: <aWCXOX+OKvWsqzNM@yuanjiey.ap.qualcomm.com>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
 <20260108085659.790-11-yuanjie.yang@oss.qualcomm.com>
 <k2orlbxktyqhuuoievurde5vglpbx2qqhkbmnasfnefax6p4tv@7hhmnyomtxyy>
 <aWBpEIHLtmCyZ5C8@yuanjiey.ap.qualcomm.com>
 <wgx4q3f4ktpoyq4u7rrquy7rs66hwidpr7dfxvw74w2xf53toe@kh3qy674des2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wgx4q3f4ktpoyq4u7rrquy7rs66hwidpr7dfxvw74w2xf53toe@kh3qy674des2>
X-Authority-Analysis: v=2.4 cv=GN8F0+NK c=1 sm=1 tr=0 ts=69609746 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=5yRySJssvr81LtH4ww8A:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: v3gsv2yezIyobFMKdXGDlwAT-t756Uot
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDAzOCBTYWx0ZWRfX3zAAWBAqX/QY
 TfG4+1s4w1gO17o7JOIxXyGzrIjL6yrx9WV0/Mv5cfnfy6iYHSXed7wYGYgOq3vD7RWZeZBxpK6
 D4k1FG1SbssLKYuAOzlycPzVx89i80MBrZ4JjKhWNPax0U2Qno6qY/HcySRHgYwvPS51bo8hRKa
 IEfwOzl7/yPjzr83aTgZJfonS46f35og0jxs5hkd4ZUcqVP0PB9Ts0e+JfrNOubn8f7CZZ1QZwV
 Zqdnp0haV2rESgRl/QepOPoBnbO/Df/PktT20BDmmt4Mj/uWXTppP6xwJzA55kvmZzddXZi0N3v
 r8pMA149hWnX/jDB64nGgoQEWjoyVhLBuOb/qpBtu8khTKw1o4LLjSCDEOYZ8ijmdj9/85lW3mr
 j9vplzCRf5HtwJ/iettKQHygFkFaSzJLdgkkRFMp5e+iR7sI08TskOprhokNNZKWRsrPS/N4EuN
 pZXuwglZwwtcA4wfBJA==
X-Proofpoint-ORIG-GUID: v3gsv2yezIyobFMKdXGDlwAT-t756Uot
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_01,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090038
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

On Fri, Jan 09, 2026 at 05:25:26AM +0200, Dmitry Baryshkov wrote:
> On Fri, Jan 09, 2026 at 10:33:52AM +0800, yuanjiey wrote:
> > On Thu, Jan 08, 2026 at 03:46:18PM +0200, Dmitry Baryshkov wrote:
> > > On Thu, Jan 08, 2026 at 04:56:57PM +0800, yuanjie yang wrote:
> > > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > 
> > > > Add support for Kaanapali platform SSPP sub-blocks, which
> > > > introduce structural changes including register additions,
> > > > removals, and relocations. Add the new common and rectangle
> > > > blocks, and update register definitions and handling to
> > > > ensure compatibility with DPU v13.0.
> > > > 
> > > > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > ---
> > > >  drivers/gpu/drm/msm/Makefile                  |   1 +
> > > >  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  14 +
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  14 +-
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   4 +
> > > >  .../gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c   | 321 ++++++++++++++++++
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  18 +
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 +
> > > >  7 files changed, 371 insertions(+), 4 deletions(-)
> > > >  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
> 
> >  
> > > > +		c->ops.setup_sourceaddress = dpu_hw_sspp_setup_sourceaddress_v13;
> > > > +		c->ops.setup_solidfill = dpu_hw_sspp_setup_solidfill_v13;
> > > > +		c->ops.setup_pe = dpu_hw_sspp_setup_pe_config_v13;
> > > > +
> > > 
> > > >  /* QOS_QOS_CTRL */
> > > >  #define QOS_QOS_CTRL_DANGER_SAFE_EN       BIT(0)
> > > >  #define QOS_QOS_CTRL_DANGER_VBLANK_MASK   GENMASK(5, 4)
> > > > @@ -475,6 +482,17 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
> > > >  		      cfg->danger_safe_en ? QOS_QOS_CTRL_DANGER_SAFE_EN : 0);
> > > >  }
> > > >  
> > > > +void _dpu_hw_setup_qos_lut_v13(struct dpu_hw_blk_reg_map *c,
> > > > +			       const struct dpu_hw_qos_cfg *cfg)
> > > 
> > > Will it be shared with other blocks (DS, WB)?
> > 
> > yes, _dpu_hw_setup_qos_lut_v13 will be used in WB, in function dpu_hw_wb_setup_qos_lut_v13.
> > 
> > So maybe I should drop '_' rename _dpu_hw_setup_qos_lut_v13 --> dpu_hw_setup_qos_lut_v13 ?
> 
> Yes, please. As you are going to resend the series, could you please
> also remove the function from the header?

Sure. But here a little confused.

Do you mean I should delete _dpu_hw_setup_qos_lut_v13 in header,
Or I should rename _dpu_hw_setup_qos_lut_v13 in header to dpu_hw_setup_qos_lut_v13.

_dpu_hw_setup_qos_lut_v13 is used in dpu_hw_sspp_v13.c and dpu_hw_wb.c, so I don't think
it can be removed from header.

Could you please help me clarify this comment?

Thanks,
Yuanjie
 
> -- 
> With best wishes
> Dmitry
