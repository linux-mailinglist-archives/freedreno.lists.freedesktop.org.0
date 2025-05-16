Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E7BABA563
	for <lists+freedreno@lfdr.de>; Fri, 16 May 2025 23:40:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83BC110EB9E;
	Fri, 16 May 2025 21:40:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FZxCk93D";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14ECE10EB9E
 for <freedreno@lists.freedesktop.org>; Fri, 16 May 2025 21:40:13 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GBRxhJ023734
 for <freedreno@lists.freedesktop.org>; Fri, 16 May 2025 21:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=WLyt+5Z0AOIejFDuTl8oaCpz
 mlN3FLZTqlnnQr41U2I=; b=FZxCk93DJkNcuvKAn8NQGI5E3U1ByqkuzIlIXHwl
 iS8RWtkTnRKnLl24gpFtA246E5VseX+zuE8I757cgPLvv+mBYyn2IXNBe98hKHP/
 d6VJybk+eyFFuYmNh2tPNuO/t4ibS0r6hxAf2MEduKGtJOuqd3gyFruTFnmJVevW
 feci+RPVlYx9FPqICCUEvrElyV/A9TiY1pWYM8abiQLE6piykZhs86Z2YArc/kSb
 0A7ez0t6JH8/3hJIyXskqiKrFpi7fDEsvDUcOzig0n+8+9pgvJOehdb/z0w0RrUr
 EpMezCOrEcuDmmMkfmIfuhWr9Bs4/p/utgw95xTeoo8PdA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46p4gq9gq8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 16 May 2025 21:40:12 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f6f2c41eddso55022256d6.2
 for <freedreno@lists.freedesktop.org>; Fri, 16 May 2025 14:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747431611; x=1748036411;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WLyt+5Z0AOIejFDuTl8oaCpzmlN3FLZTqlnnQr41U2I=;
 b=lMWej3rGuEU10fyW+IZw3mwkxowUz/ucFQJvJdVznTkfMvrj5DwlqsD7zHbQ36C90F
 NWXl9TF3PJ7U7MpBuyikZpHAuMySijG0ApPvd8uXFazVzGigm3/WOaM/Gdy1Q6YrtjTK
 R5BpJhdEsNvs5L/LgKnMAqTdiCSCwmajSZ+MQ7z1ekit+5ZC1Z4kQOq6iMgohseIM+Ue
 AMujysddZ9sBLItSdrct4CH+BDIWX1NZm6hehifWseOcxHlHQP4aZWZxXvh/FX6mgq1T
 dxaZQz7nntfi2kkpliXp96bFG6El4LrojMQZKzDWQFS65FaaFi4Y7vxHA68Bz+K7cHrR
 pslw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuhTw3sMpliWU3152NXwh9gUrT74pdVvPstZtIgABNshZncRUkvCQI+hI5rnOk4E8qAFY4ogO7zQ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+3Cueiep+OH2IOEa1pyiXaiB1eVLSWjfbujlhYGmfVx7tpUgA
 8Kd1Z7112d68JK8fKMf2ZxGowG7c+lXDdv4C62rnvxtIXg2ovMJNFo4yjBS3Uh8UgNswg3pDu3P
 U2Vu0U8wcXevuLxXaDna1FgPObCwSrHha2tB5+jNbBPI5y2pj9OJZwmOgmT+Kx2l5BFfMnlA=
X-Gm-Gg: ASbGnctFFcC9ZZmXOMoTxL0dAKydPvAftg3cyisiu5e7wS09lQxDRttqAi+RBPgKmM9
 ig/+IWgbv0V3XcMXadU2ViarV7H1r8NGoGOBhwmjQqX6ZPB3urQtt8ECYNtboD6h5gHuUFG4nAR
 feTFxwmnVpeygW1JeZukyAs3Kjqt1IPvVVVkc5sw0wKydIMNjs+OCC/dhNfRxCnovAhdwxbH4k/
 OiqR1EbChmVmi08PwXCEblEyZyf/3alKpmH+zPmvdx2FFu9moPBgUNpbXhtos3IQbxTEkPb/kIs
 B53GmSvfoWUievnsvVib21i5hXRrCpAiNd1hd07axEYe4IbU1J2KfNLvC0ABfjA28F0XJRPAXVQ
 =
X-Received: by 2002:a05:6214:2341:b0:6f2:b7cd:7cac with SMTP id
 6a1803df08f44-6f8b08aad53mr84737166d6.31.1747431611237; 
 Fri, 16 May 2025 14:40:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlSkHU/95FW0SPZKEO3RfhsXaoQpKMCqmBdWYPgcm4PwTrfg++Ymk08ToHgTYtlLPYBsZyPQ==
X-Received: by 2002:a05:6214:2341:b0:6f2:b7cd:7cac with SMTP id
 6a1803df08f44-6f8b08aad53mr84736776d6.31.1747431610813; 
 Fri, 16 May 2025 14:40:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e7038518sm595002e87.210.2025.05.16.14.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 14:40:09 -0700 (PDT)
Date: Sat, 17 May 2025 00:40:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] drm/msm/dpu: Filter writeback modes using writeback
 maxlinewidth
Message-ID: <62vhglzixy2hl7uhl3queml5z3vvvqw6kefhaboip3iql6ep4e@kbl4yihvj65g>
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
 <20250514-max-mixer-width-v1-4-c8ba0d9bb858@oss.qualcomm.com>
 <CALT56yPxcsLhA2eigirjvNiWR5JBFW4jsOAi7QWkgmJgbMnKXw@mail.gmail.com>
 <65cb9653-e315-4b8c-ad21-14cabb7d2ac0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65cb9653-e315-4b8c-ad21-14cabb7d2ac0@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Kq6CqbNPRjsHYoq3RuJmhi59xsVcj59y
X-Authority-Analysis: v=2.4 cv=KulN2XWN c=1 sm=1 tr=0 ts=6827b0bc cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=Ey3AjrcxibMDRGd7HuQA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDIxMiBTYWx0ZWRfX2kM0JE8w2krI
 YnIKtWKXaQkVOzg6QlYM1Uvjalg/BkLQzGVs5LdGcTbzNVqeCR2nnH1znbEvItIjfsNI9s2drXu
 ayLN/04d24bcpKXlyf0wsE0UGSofcs4RYIyNRNR2LbBtb34qMvkwIqVyXWXmldMnjepQ4brWsyi
 tIAO3KTWo8qM+EWgzzwK+egOtyRE5rYyCAWa8J+DHjWiImh2LaRi5VQxRvPtn70iKQCbeTfloNz
 cbqCp5qmM6TRs2amiS4zYgXgO3TvF3G0IlVjjLqkpkYud+1/CY7NLkzpERwtdptxRYZ5QrKlFGq
 ogW7uAI+NAVnFTWSKfE82aLxEqNa61g0z1KAJupB11jJr+S6mXlpWXoRWMbc80O42BliU1seYYH
 B5etL9oyJAkGicoWNPk0uLXUcX+bpBrK2yaDSlIq3SZXIFP8oWI+vtJRaE5IkN2Ewyu95qjb
X-Proofpoint-GUID: Kq6CqbNPRjsHYoq3RuJmhi59xsVcj59y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_07,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 bulkscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160212
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

On Thu, May 15, 2025 at 05:48:09PM -0700, Jessica Zhang wrote:
> 
> 
> On 5/14/2025 5:17 PM, Dmitry Baryshkov wrote:
> > On Thu, 15 May 2025 at 02:52, Jessica Zhang
> > <jessica.zhang@oss.qualcomm.com> wrote:
> > > 
> > > Since the max mixer width is not a strict hardware limit, use the actual
> > 
> > Is it? What is the actual max width that the mixer can support?
> 
> Hi Dmitry,
> 
> By hardware limit, I mean restrictions based on the size of buffers within
> the hardware block itself.
> 
> PINGPONG, DSC encoder, and WB blocks all have buffers, so they do have a max
> supported width based on the size of their hardware buffers. On the other
> hand, LM doesn't so it isn't necessarily restricted by a max width.
> 
> I can clarify this in the commit message and cover letter.

Yes, please. The text above is perfect for the commit message.

> 
> Thanks,
> 
> Jessica Zhang
> 
> > 
> > > hardware limit (the writeback maxlinewidth) to filter modes.
> > > 
> > > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 9 +--------
> > >   1 file changed, 1 insertion(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> > > index 8ff496082902..0a198896f656 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> > > @@ -14,14 +14,7 @@ static int dpu_wb_conn_get_modes(struct drm_connector *connector)
> > >          struct msm_drm_private *priv = dev->dev_private;
> > >          struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
> > > 
> > > -       /*
> > > -        * We should ideally be limiting the modes only to the maxlinewidth but
> > > -        * on some chipsets this will allow even 4k modes to be added which will
> > > -        * fail the per SSPP bandwidth checks. So, till we have dual-SSPP support
> > > -        * and source split support added lets limit the modes based on max_mixer_width
> > > -        * as 4K modes can then be supported.
> > > -        */
> > > -       return drm_add_modes_noedid(connector, dpu_kms->catalog->caps->max_mixer_width,
> > > +       return drm_add_modes_noedid(connector, dpu_kms->catalog->wb->maxlinewidth,
> > >                          dev->mode_config.max_height);
> > >   }
> > > 
> > > 
> > > --
> > > 2.49.0
> > > 
> 

-- 
With best wishes
Dmitry
