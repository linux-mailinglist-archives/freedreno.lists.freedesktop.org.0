Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD70AC6DB9
	for <lists+freedreno@lfdr.de>; Wed, 28 May 2025 18:17:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6CAC10E689;
	Wed, 28 May 2025 16:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HQG8jL2K";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6A510E686
 for <freedreno@lists.freedesktop.org>; Wed, 28 May 2025 16:17:20 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SE5bt6028239
 for <freedreno@lists.freedesktop.org>; Wed, 28 May 2025 16:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=VxpVLFBQGSAU+ebxYoQdGVlC
 qZnUme8PP63pkL+w6mw=; b=HQG8jL2KEaz3iRI7+/X70BOGq0pySi6cBM+txh6p
 wwfS2VZ87Whfg9qHLepHGDouRDd+QwZHiq2TCtS3T5HrXpxyPZ4/QUEwG1Qq0fTy
 qcwoRgB2BVUHGd1rP6AjofhexVwRmoH7LbceKGqCzOdnpXm4PGvlkanS/+sB/21l
 axt1rK1+T7z6M6WJy+zTGfImJxTbM9Zpgoh/siYhtXDu0qbQdbOslqAp7G76ml6j
 rDYYX8YwkfBsRCS90CxTlvEEhsz+yeiw4L+z0UiAOa12GFDZdpmpBLl2LvL3snPu
 yQUgCx/hRIHs2NMtJdRMO9qC3SM5ZBbcgDo7iq6hVtIgHg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992mw5f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 28 May 2025 16:17:19 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id
 46e09a7af769-7351a0abd12so2104073a34.3
 for <freedreno@lists.freedesktop.org>; Wed, 28 May 2025 09:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748449039; x=1749053839;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VxpVLFBQGSAU+ebxYoQdGVlCqZnUme8PP63pkL+w6mw=;
 b=Kl+GWWPNZGepWD2yEBhItG+Lc+MA48khavmF0y0TXMcW+s+8eAF+xNgFXzXjCYGn1w
 uVkd1y0OKDWNpIyQvUEP1go4en4kuiuXcL3Lwx8sgTugb3bpdMSBFMONc2NkrSYWRufM
 CyMYWPCzQZg42O40J31xSCt0SMb4R1vEHRKgmequCY/Y5/l3CIbDo8JOe5tSsdOPHNMO
 B2He6zD/G92qcfNEln0oXa1huqXIcgL5RDxC9GrfH7iAsNqX9BFwtcN6eGNyAKjoMosd
 jBroihKkf3KVaka42+D+svfB9aR5JBWh/6xC4RtD3EfKJb/ptYtT5DySspV+2s12KVcX
 WeZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVA+NAL81to2nDsYhWCo1XHmWZiZKn1Ngebg1s0khngJULYn113lT86vTGRkQyM4pj/eRAx+9wuOjM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDYby4BvU7wz03nBlA97xMuSFG6BRKPsz3aWGzyPh7lF5dxxGp
 OaNe0Ve6hHPODlRbTNUlod7Vgx8wE1Bc8L41RvteiatdpjEDn3XiwvWxDgyRIG3PWg1p3VUeZyE
 ghYDXRRIM8n8Kpjzt98FjMOLdM8i93mVvcJ4h9GIuRbsubh5syLnJ0UDr0szIKp3boqNEv3Q=
X-Gm-Gg: ASbGnct9sL3xHWXmbPjRADmKT325CjtSrsXNKQCY9Ry9xLcSRzE+h8ERTiR2QBu116Y
 ljlfJLqq7DZpqyEMcxG4VkdtG7WBfGg7D0166k+hZ+4cgOgWUQ0lxF6QaYWe8O6guO6N1yMrLAV
 1JbE7iCgMieE7uX9StgReWk49vbvFjr6mLrq10zbWejpZheqMukpTaLFCkq/UKdU5/WwlIZbbBF
 VBNT+5RZBdrqW33bXRD7eucIUHwTpjdYhB6EDqQ5av5dWhr4/fr1CDtHYOdDPuJ0o1JYP7U88nt
 R0OSMKogc7d02J8u0kzxG6Iq8IVABUQgQyZsVPn4bOfBsg/C8T5o9jOtT8cdx9m/ybGxH+tjNdc
 =
X-Received: by 2002:a05:6830:7010:b0:72b:8326:f0c7 with SMTP id
 46e09a7af769-7355d1ca50emr11492070a34.28.1748449038856; 
 Wed, 28 May 2025 09:17:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHymD5QPdG3sq4BRZVWcnUYrodeFvRGV9A9NykcrdI34F0kJ6xyyBvUoKiYlRqJdH2mRLZZDA==
X-Received: by 2002:a05:6830:7010:b0:72b:8326:f0c7 with SMTP id
 46e09a7af769-7355d1ca50emr11492023a34.28.1748449038359; 
 Wed, 28 May 2025 09:17:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5532f6b39dcsm340216e87.215.2025.05.28.09.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 09:17:17 -0700 (PDT)
Date: Wed, 28 May 2025 19:17:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Stephen Boyd <swboyd@chromium.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vara Reddy <quic_varar@quicinc.com>,
 Rob Clark <robdclark@chromium.org>,
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 17/45] drm/msm/dp: use stream_id to change offsets in
 dp_catalog
Message-ID: <ujrlphqfh6j6n2qz7wslapidmwacnj32cgdhwahmqpjpylmmk4@daraslg4fdk3>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-17-f8618d42a99a@quicinc.com>
 <45awcx2az5m5v4etpuaycqx2dolzjkrcjg6ehmooivwuqb6ac3@euo7rsoccqup>
 <187d55f0-f4ec-4d5e-a449-708ebed1ab45@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <187d55f0-f4ec-4d5e-a449-708ebed1ab45@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE0MSBTYWx0ZWRfXxmNPw7L57Rbr
 haK+6qmAsec/Vhr4ZzjLJODMVxljaezmlMoKjabnbqfXCQCumuleLv4T0I3kzw3VnQElJOQwA2A
 D22O4sSrFHNQGGNOPvurmoP70UPkT4pfPKOhcroUDhR1+rTzwmIqb7GRB02tzE1Ynw+T1TE0sgj
 VsP4c+7F1hQwwMHPsJLlZP8F31MMFGAYKwQF0Fj8HtspOjEKtt5bhgCU43LM4wbbGOTAd/kQ32/
 tioTV1+xVJT2eKihYbxiBcU/xGLwbjazZYsD3QVj2eTcenTOxMnYzSAlMUmffLB2dHLZ3K8WlIA
 uKTTy+8WwxmqRxmJJ6gElLfV5TCmWnAHFrNsk5BFpO7g8NFdbl2xO1E0v6oNTZWybDuDSHFbOzo
 UBTciquBFpGe4pJKoDK3XdhLDM6BmaTmwmUR8SOhMTHBwWzEL3DT2AnlUxS/DfjhgrYmjeLH
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=6837370f cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=aWFAwB44HXOIBnsjnyQA:9 a=CjuIK1q_8ugA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: JJsrDY9IIoL-A_-a3UD5r7XfwUHAuS4d
X-Proofpoint-ORIG-GUID: JJsrDY9IIoL-A_-a3UD5r7XfwUHAuS4d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_08,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280141
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

On Mon, May 26, 2025 at 08:57:35PM +0800, Yongxing Mou wrote:
> 
> 
> On 2024/12/8 13:42, Dmitry Baryshkov wrote:
> > On Thu, Dec 05, 2024 at 08:31:48PM -0800, Abhinav Kumar wrote:
> > > Use the dp_panel's stream_id to adjust the offsets for stream 1
> > > which will be used for MST in the dp_catalog. Also add additional
> > > register defines for stream 1.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_catalog.c | 99 ++++++++++++++++++++++++++++---------
> > >   drivers/gpu/drm/msm/dp/dp_catalog.h |  9 ++--
> > >   drivers/gpu/drm/msm/dp/dp_ctrl.c    |  3 ++
> > >   drivers/gpu/drm/msm/dp/dp_panel.c   |  2 +
> > >   drivers/gpu/drm/msm/dp/dp_reg.h     | 13 ++++-
> > >   5 files changed, 99 insertions(+), 27 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> > > index 172de804dec445cb08ad8e3f058407f483cd6684..662bf02b8b1a5165f927835bef3c11ac091ddce6 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> > > @@ -309,7 +309,9 @@ static int msm_dp_panel_setup_vsc_sdp_yuv_420(struct msm_dp_panel *msm_dp_panel)
> > >   	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
> > >   	catalog = panel->catalog;
> > > +
> > >   	msm_dp_mode = &msm_dp_panel->msm_dp_mode;
> > > +	catalog->stream_id = msm_dp_panel->stream_id;
> > 
> > Why is it a proper place to set catalog->stream_id? It doesn't looks
> > like it to me.
> Ok, maybe msm_dp_display_set_stream_id is more proper place. Or can we drop
> stream_id in catalog totally, and f the stream_id is needed in the catalog
> function, pass it as a parameter to the catalog function. just like that:
> int msm_dp_ctrl_***(struct msm_dp_ctrl *ctrl, enum msm_dp_stream_id
> stream_id,***);


LGTM.


-- 
With best wishes
Dmitry
