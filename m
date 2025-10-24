Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77484C0431F
	for <lists+freedreno@lfdr.de>; Fri, 24 Oct 2025 04:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A4A10E9C1;
	Fri, 24 Oct 2025 02:59:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eUrSOHyj";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF1CC10E9C1
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 02:59:21 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NEWuUI032198
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 02:59:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=alHbWdl9Rj2RBorWf/yZSPFW
 VTNaKm9v1UuWbZYPNvQ=; b=eUrSOHyj7vWrS2OW5rC4UsVIJg5sxsso6QnHTwpF
 wsk6WgAezBockomuEiWMVZJ/Ihf9AqYUyJaiY1UUFMfD9BdifmOZySj2dh+//afH
 gl5O2dqNb5SskkfICscvFv8ZJ4PlEnmOe5U2oKoSoWO6h7lfNS2M/6gZ47aTpzHg
 ZcGUILrnS+M+WQNCkJVtrXNS/kcmeX3Hlj3dSpJgkxZUsu2V/QcgqeUNOT/EN4G3
 ViG3Lek8j9TvmY1EV8rgEtcwX2PwezOLkw373YD8UVQq1a6m1LwKGCz5FvbcQnTN
 LI/AVcYq93xWoPiwbNorIadVkXLW6L6/tfiXFh9Y/B9Prg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2geak2u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 02:59:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-84a3a7ac082so386934985a.2
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 19:59:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761274760; x=1761879560;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=alHbWdl9Rj2RBorWf/yZSPFWVTNaKm9v1UuWbZYPNvQ=;
 b=VkHTmPZpoGocbh+pXBLba9u5LcbUogm3PeUstbrjf34jpt+xxZUT8WWPhJsZD57Zxh
 M6JWvUyjskYrCS00YeuIThefLHU71pNaOCBMEtSYWFEYpJEtrlWYu7TQgFTFJVp877CY
 b4j1HC6RsSwB6GezEzHqf5Tc+yuphb1I7TgBbZLD7pND7WKZanEvQl13dGuL2nrGK7Xf
 SziGFcb5UU3ZTnr++Ovlc8JTzk7JqXrv8yx0KBef8vSV3ciPoFnxjt3gj5qqEb/8faUw
 mmx3ctJp90xt/5AuekzGrMe6+0iQLzA127sOF8bA2aP8TuDIuLOMBeghpWRuJSAI6mJw
 RWoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVE+KcHeL7wi1dXvGRs831sQy6rpX4FXQX4Xlg+gQN2R5nvT5xSGInGa18f8qfBuTSLTo5pVSGrGuM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxD+d6fAqGLCi8v1T1P0/GDh2zB6h+wMHqExgyIg9GAwXlfDTV
 tK77VA5klcqcrd/olIBzQeeEqQb6F611Ii38VmDkqyw1r4ii2dxu6rf+D2c1OfBzidGX8cLa0ku
 N8AWxif/cLIOHfhzyz1Sq1QIAURX4PlqYqJyfI/bIlE+0+yn+Ue3zFBDh2zt0Nkm0kd8adiM=
X-Gm-Gg: ASbGncvfu+cXnq5iWGmfxMSIvFX+2ScVnHlt1oZ58/QwBgfqmbxCBag2KDlYpAReK5u
 U0Z7+/3fL0RvloW6vqo/LXPko8ida0aP3qi/0qIiQKVMmsQ1Z/V77N3dmX2qz0vjd0UEIx3WvIQ
 DToPb4ofk6d+mcDBJrUtKaV65NdEYQoL9N7ujbvV1Re9dYZH9u9SpjpqyThlvCX2yZ+TjQwvB5U
 TiJ50mJtRmC34MjMxpv705Y4MoGNc1xruL27cqHT4cLp4JO9t3TGpO6q3UocQuqRYszQSOc/Vy8
 c8ZGqQanPalAb5WgEY91D/Pc64VujKxhoGwT81YMUSWiXVAh6QuMqY843G3NtNC3BBuxhC1ZjFE
 ieXpwCFJ8SV/dUFwbKLbIVItj2NXZDeqfs24QHCP56p/SawM5V20aUCuLv8tO
X-Received: by 2002:a05:620a:44d1:b0:89a:ad1c:5135 with SMTP id
 af79cd13be357-89aad1c5576mr1081388685a.0.1761274759980; 
 Thu, 23 Oct 2025 19:59:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHu/QPO9m9brJvJf/IlDol46ZUfnhMKMfRAWUSM0GHftzDhJSrp/isYST7dyuvvS0TjSLd0GA==
X-Received: by 2002:a05:620a:44d1:b0:89a:ad1c:5135 with SMTP id
 af79cd13be357-89aad1c5576mr1081384785a.0.1761274759524; 
 Thu, 23 Oct 2025 19:59:19 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-89c1264383bsm291555585a.59.2025.10.23.19.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 19:59:19 -0700 (PDT)
Date: Fri, 24 Oct 2025 10:59:07 +0800
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
Subject: Re: [PATCH 03/12] drm/msm/dpu: Compatible with Kaanapali interrupt
 register
Message-ID: <aPrre+WXogSZIE7L@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-4-yuanjie.yang@oss.qualcomm.com>
 <nfekr4vi34ftxzyyf5xv4tsb5cr3tokiyfkerypqjf26dos3uq@42wcn6ji7nnb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nfekr4vi34ftxzyyf5xv4tsb5cr3tokiyfkerypqjf26dos3uq@42wcn6ji7nnb>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfX7284lH7h4bUW
 OhMRa24yxwnuHRpNCJfmeQAsktBymc0HvmF2//icHLGGsugBGfk6IHP/VxSNIOZeMPYh8izrCvL
 RYzi5hnDvS7rItAc1pJEpfc+PYVS963IIkT2Z6+9/I6Ut4VEMDZvUcwUy+YrY0x+0L94RuLJ2OS
 PW2Aj93fZJ+7AMZSvjchK4VsM1DxV3VWAGiTfsmSvQow98a3E29Q1ZdiRZoJC/pnGbYiE8vQLfi
 hg3g0ARAV8DwNaSQDR8KuIci3loWhBy5rpfVAovU8R74+3Cbaze0vLlvTzSFAZQ6J+sQMX/rFx/
 fZP4nBKH6XtbQeBE563v4uUzm9qLTkphnwY524TCbRYg2QmRD/iQFRvT37OJvkHRNzBD1TgGQwd
 aIYg3Tll9jE3bj+mFbAfSwLBry6xqw==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68faeb88 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=EXeeq68Q20KqPfprLVgA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 1uAkpiuMXfONk_JYpXhO6jcRP8x6SpKS
X-Proofpoint-ORIG-GUID: 1uAkpiuMXfONk_JYpXhO6jcRP8x6SpKS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020
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

On Thu, Oct 23, 2025 at 02:59:12PM +0300, Dmitry Baryshkov wrote:
> On Thu, Oct 23, 2025 at 03:53:52PM +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > DPU version 13 introduces changes to the interrupt register
> > layout. Update the driver to support these modifications for
> > proper interrupt handling.
> 
> So... Previous patch enabled support for the platform and it has been
> using wrong registers for interrupts? I think that's broken.

I want to express DPU 13 has different INTF register address, so need to add new
interrupt array to let DPU 13 interrupt work fine. Maybe I should optimize my commit msg.

> > 
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 89 ++++++++++++++++++-
> >  1 file changed, 88 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> > index 49bd77a755aa..8d265581f6ec 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> > @@ -40,6 +40,15 @@
> >  #define MDP_INTF_REV_7xxx_INTR_TEAR_STATUS(intf)	(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x004)
> >  #define MDP_INTF_REV_7xxx_INTR_TEAR_CLEAR(intf)		(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x008)
> >  
> > +#define MDP_INTF_REV_13xx_OFF(intf)			(0x18D000 + 0x1000 * (intf))
> 
> Lowercase hex
OK, will fix.

> > +#define MDP_INTF_REV_13xx_INTR_EN(intf)			(MDP_INTF_REV_13xx_OFF(intf) + 0x1c0)
> > +#define MDP_INTF_REV_13xx_INTR_STATUS(intf)		(MDP_INTF_REV_13xx_OFF(intf) + 0x1c4)
> > +#define MDP_INTF_REV_13xx_INTR_CLEAR(intf)		(MDP_INTF_REV_13xx_OFF(intf) + 0x1c8)
> > +#define MDP_INTF_REV_13xx_TEAR_OFF(intf)		(0x18D800 + 0x1000 * (intf))
> > +#define MDP_INTF_REV_13xx_INTR_TEAR_EN(intf)		(MDP_INTF_REV_13xx_TEAR_OFF(intf) + 0x000)
> > +#define MDP_INTF_REV_13xx_INTR_TEAR_STATUS(intf)	(MDP_INTF_REV_13xx_TEAR_OFF(intf) + 0x004)
> > +#define MDP_INTF_REV_13xx_INTR_TEAR_CLEAR(intf)		(MDP_INTF_REV_13xx_TEAR_OFF(intf) + 0x008)
> > +
> >  /**
> >   * struct dpu_intr_reg - array of DPU register sets
> >   * @clr_off:	offset to CLEAR reg
> 
> -- 
> With best wishes
> Dmitry

Thanks,
Yuanjie
