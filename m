Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09808D06FB2
	for <lists+freedreno@lfdr.de>; Fri, 09 Jan 2026 04:25:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F0910E7E3;
	Fri,  9 Jan 2026 03:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zf1fM6oc";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XUdx6e3x";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B97B810E7E3
 for <freedreno@lists.freedesktop.org>; Fri,  9 Jan 2026 03:25:30 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 608IUIkY2986124
 for <freedreno@lists.freedesktop.org>; Fri, 9 Jan 2026 03:25:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=c1FKPH8l16cGJoXn2zSMGvS/
 GHDw+D/u2O8httFkqlA=; b=Zf1fM6ocfch8lu4T30ShlcGytnsHHSpEUg4WJbhU
 07XBEUxk/4JF52i9Y8aonMQNcRzEnfRRuw4WRxQpSXSaSnBTtkcyRIyAuyVIdtcr
 fy22KIqnasQ4zCYZt2v7bDtY+DmOzab4F5tZgumRh+jdl0Q4MeqA/DnYvmVSM5Zg
 WfP+LJrCj4a2r3BsmtfP2i0WTVW0gipVonge2Iac90+Ty/emLIGCAjQw+ZgHq2k/
 Oqb/HMsO2ZHGZ86O5kYhTvLkoPpUY/hJ9nTgF/D/cFAk5K5B3irlCmHNhfdwpdAw
 IEAlt9dzRc+hIA0LLunIy8bnCNTgEbP5Z1mPrM9g8KVGdQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjhwx17nx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 09 Jan 2026 03:25:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b51db8ebd9so1209096685a.2
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jan 2026 19:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767929129; x=1768533929;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=c1FKPH8l16cGJoXn2zSMGvS/GHDw+D/u2O8httFkqlA=;
 b=XUdx6e3xkYJngs4uwqxXcheGTSOTggSgIvR+HQdKwwNOJQOFxIXiiP8nt+AbEucUiE
 yLutAnbQNuM7rY2EZGdDemhb1eg5jAxOb2j/LSbtbVNj9Cl4fCfhx0iMufSLDk4P0ht/
 mzWULdz2McQP+QSuKJPhm2W27xT+WfP4L3HehQm/uP/oy8uR5q/6aCTShyIRr+5JmfsO
 chK9D3bVTDx/6nKPH9+7OLcCZ3OACkLWT/YFQu4lpmdFYNurRpj6EMsGML4ADfwCo0Pd
 cytSSmIKr6jInaMs0WuchqC4v0HRFvq9DscCNOfQsLvkSvHC0LLkstQhFpD/SgxDbO7f
 vzMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767929129; x=1768533929;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c1FKPH8l16cGJoXn2zSMGvS/GHDw+D/u2O8httFkqlA=;
 b=LWebkp57otfVC6eTBGp3kkAkJpEWiOCBfkBeNiw06dMn1elGactuV0eQRnbGNskARw
 JTM8ofwjcumBl6sNnvZ9aCfboxDZYLXw0oazBLArMP+urP8mb5Gdi/AgXPVBLkrIUlzB
 YdC51shtWNBBDyRuT1Zn8YBlAb6ymSZ71Wr7VzlsmbbM29rut4aMhHXJCt/uz6+ZIJeB
 B08zZXfDJJ++HuOpErUg/tpnjpdqsTxS+s4Pl3jcA13aaMxoTsQICpkgSHo2kiGQIVWZ
 2efEMVNwD8Ze5USIPnrDXhViOOXqKeUfw3QAS3luzOX9ObKFVHPBZeczrwaxeu6uTNxL
 Q89Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqKjE9dS8/4iIdtdSpjYbX3ZvcKwv2itC/7QoFMLHCOo2+k2Cbwcio4/cVIVMcbo8FmxwDef9RXbY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcxNoTVIW3GB7lVAHbCCgJfxYTxoLSH5qDNMY3FagS0AoVZgbx
 colg/n1ds5JlVMtBiAgyh/ylVG0LO6I5JiZhhUPOIbPuNzr44SUSusZTxggnnzvR0HXIYj5xHxO
 k+F17CkhIw514BS0OwJ4c2fLLSRzGS4qe6foXysrPNKmX2DPvBMHgv0bcX1LifEAX2JrgowY=
X-Gm-Gg: AY/fxX7aIfr8TyQ+qvpCVztbCqLuLVtz5MwyzQKAG0ujEsR0KdXrTjeUBY8BpWAA06s
 fCgkjGQEqTSpBUzoqOTSrCVbba6vMcOoIHev3C110LsVPtuZf0JEWoAHw+T2sxXBl/JOyyKL1kY
 yK3oq+eFOZQ22uFEr/Zz5tn+Gk4ydSKcmSYQYCkbeJ9KAJKNuyQpG1B+7oWuCgcsoxZhGyiXONC
 FjwEv/x58nCFBf8A0RVGr7QdqXNibSKu6X1dqIele7lwuReoE9kUaWStEUGnQJMu+QtiKJnqgHw
 AIpdVZ/Z1vSghv+cqPY1rpHnuo/P02sABBmlStn58/w5VT3FLd8J2t4SGfmzmK7RkftRYfmTc6d
 dTV2j3IquJE8CaH08oYbsYwmA92/l3K8wMQkbV5GXa4x9QS+9sPC6nN84UZNMOQOSwb+BLtFNS3
 xxRkUvV3avCbvP6CVLO4LuAB8=
X-Received: by 2002:a05:620a:4802:b0:8ab:8037:509c with SMTP id
 af79cd13be357-8c389379d1cmr1039303485a.12.1767929129046; 
 Thu, 08 Jan 2026 19:25:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7POTAZbGqCpGluds596QJkhD/U1qqkBoYNpWwEpul7vXI/0CQ8FgavMG4km/E65OtbPFIdg==
X-Received: by 2002:a05:620a:4802:b0:8ab:8037:509c with SMTP id
 af79cd13be357-8c389379d1cmr1039301285a.12.1767929128612; 
 Thu, 08 Jan 2026 19:25:28 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b796a135esm783614e87.50.2026.01.08.19.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 19:25:27 -0800 (PST)
Date: Fri, 9 Jan 2026 05:25:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>
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
Message-ID: <wgx4q3f4ktpoyq4u7rrquy7rs66hwidpr7dfxvw74w2xf53toe@kh3qy674des2>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
 <20260108085659.790-11-yuanjie.yang@oss.qualcomm.com>
 <k2orlbxktyqhuuoievurde5vglpbx2qqhkbmnasfnefax6p4tv@7hhmnyomtxyy>
 <aWBpEIHLtmCyZ5C8@yuanjiey.ap.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWBpEIHLtmCyZ5C8@yuanjiey.ap.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDAyMSBTYWx0ZWRfX5NmXgipNeNQv
 tWBw6YGSXGEipWw0+DteQh3eKKa3hfpwH6gbD/NiRRDgsgbktBWUqzNofwKjYYSIZH8pRA8NB1a
 gdDL/n5S3VoW797mcvQQrJlsQdkeXuDfdh97L8X8c51uw9izQ5gUtlQL2mbwv8qpeBtU6+KQn2L
 zaPa5YyV3QVU3bVvoOqCrIacnwZr401G1tNIoe5EHh/ySLwxC9Kjpny1NH4BrqPSSkrK6cidUAw
 ZKEwZt7gcCsaxIZhhF4xCylyIznsrD61I9MS+JojianqH21RVO+GMaS+ZwbjPZPzNn1x9H80zlZ
 U13UqkOuK7valSugJbQoEYvbxFK09ETNDPYF1O1Q/tUwoPAaDtj+QtlBD7w5FzLzGIwsHuRH2v0
 0LDkSDBdHOAgd8TybsBVi/2Yw/cbjx3s/key+wevrj0gYWR/zCKt8DIf0b5Z/7wRHM+zB7ObaqI
 apFk1QjCRZYnVbRB+6A==
X-Proofpoint-ORIG-GUID: sZ4vQkXnWZMjf-V937PquWnJYn6tGl2A
X-Authority-Analysis: v=2.4 cv=ENILElZC c=1 sm=1 tr=0 ts=69607529 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ewj0gPjmfU4c8-7OqbcA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: sZ4vQkXnWZMjf-V937PquWnJYn6tGl2A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_01,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090021
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

On Fri, Jan 09, 2026 at 10:33:52AM +0800, yuanjiey wrote:
> On Thu, Jan 08, 2026 at 03:46:18PM +0200, Dmitry Baryshkov wrote:
> > On Thu, Jan 08, 2026 at 04:56:57PM +0800, yuanjie yang wrote:
> > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > 
> > > Add support for Kaanapali platform SSPP sub-blocks, which
> > > introduce structural changes including register additions,
> > > removals, and relocations. Add the new common and rectangle
> > > blocks, and update register definitions and handling to
> > > ensure compatibility with DPU v13.0.
> > > 
> > > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > ---
> > >  drivers/gpu/drm/msm/Makefile                  |   1 +
> > >  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  14 +
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  14 +-
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   4 +
> > >  .../gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c   | 321 ++++++++++++++++++
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  18 +
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 +
> > >  7 files changed, 371 insertions(+), 4 deletions(-)
> > >  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c

>  
> > > +		c->ops.setup_sourceaddress = dpu_hw_sspp_setup_sourceaddress_v13;
> > > +		c->ops.setup_solidfill = dpu_hw_sspp_setup_solidfill_v13;
> > > +		c->ops.setup_pe = dpu_hw_sspp_setup_pe_config_v13;
> > > +
> > 
> > >  /* QOS_QOS_CTRL */
> > >  #define QOS_QOS_CTRL_DANGER_SAFE_EN       BIT(0)
> > >  #define QOS_QOS_CTRL_DANGER_VBLANK_MASK   GENMASK(5, 4)
> > > @@ -475,6 +482,17 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
> > >  		      cfg->danger_safe_en ? QOS_QOS_CTRL_DANGER_SAFE_EN : 0);
> > >  }
> > >  
> > > +void _dpu_hw_setup_qos_lut_v13(struct dpu_hw_blk_reg_map *c,
> > > +			       const struct dpu_hw_qos_cfg *cfg)
> > 
> > Will it be shared with other blocks (DS, WB)?
> 
> yes, _dpu_hw_setup_qos_lut_v13 will be used in WB, in function dpu_hw_wb_setup_qos_lut_v13.
> 
> So maybe I should drop '_' rename _dpu_hw_setup_qos_lut_v13 --> dpu_hw_setup_qos_lut_v13 ?

Yes, please. As you are going to resend the series, could you please
also remove the function from the header?

-- 
With best wishes
Dmitry
