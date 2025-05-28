Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DBDAC6D9D
	for <lists+freedreno@lfdr.de>; Wed, 28 May 2025 18:13:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB2310E677;
	Wed, 28 May 2025 16:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UwxdCW0X";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE2810E65E
 for <freedreno@lists.freedesktop.org>; Wed, 28 May 2025 16:13:19 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S9gxwV009136
 for <freedreno@lists.freedesktop.org>; Wed, 28 May 2025 16:13:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=9+Mg2L1QBDl92rjfoNAlCPsR
 ORQMv0jh6Aoaq4vKOlQ=; b=UwxdCW0XgvFtVccaGS3wRZ6akRXte2qSsXmoqoS3
 CltOgng+fdZ+KZBEyB+3rwrxvI1kx9hWfzVucFNG0jG+1P/3/YfAgBNOnsCuwPAn
 NoircCYqIk/Ho9mJ4V0Bnjb1lJO8uKPUjGEc/a5LA6G34uJOEzzPbjIYN0bS05EH
 acwSqBHb9nbin9wykrzk8bQWysYBmn77CnJlsHDrhZsFPKs2i1GSu+CWt1EzV67X
 gzSBuCrpzSgH2GSGfNirvmfCSqVWv3b7n6XhfRM9IfU4Nb7zkXTAnKyswsnjTLSB
 1hwh1gzQeW1oWJaL9oVceakOvOdG/hZCIfNDITan6IAs6w==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46x03ms13v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 28 May 2025 16:13:18 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id
 006d021491bc7-60bad575560so2733575eaf.3
 for <freedreno@lists.freedesktop.org>; Wed, 28 May 2025 09:13:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748448797; x=1749053597;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9+Mg2L1QBDl92rjfoNAlCPsRORQMv0jh6Aoaq4vKOlQ=;
 b=uPVKGPnaOoSm+3r5D+IyfB+aNEKGev4FnlaWLd+JzEQQA/39vVEi9fTlTxqpDRk2wA
 Qt59JeKoYOZ5hxgsTiImdeNk5ld92CV/vN6aezcOnRcwJaus7SB8Ff+8HfmvpyJj/drq
 mO/Nxp8xF9UDgZHMUbu9PnslDzUT2gQ55oaXlGwiGKkABlzquyCpW65sS8inruW/ihb4
 GbdwTDbNp4BgawntEANGI9g9fRwYa8H1N1G0spvCef8v7A2okf+BStzCkZK5pyaGEHk1
 RUMGkJ+mVml8UOltI6AJjJ/tEBYab0ePygfjKZ2itY248N7c1PfS254X1pxPRCDRar9h
 ovWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpG0PIP/1bf0F2m+z+YQkcAl1LygYlcxwwh8aIxdgSJKIXVFMuYDfYopF59IIZFi2UnJ4pjSiLW68=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyzeu5EySrLu6p31oxQfSnpruP/asfdPQNQt1m7Nn9A/HnT5Mwp
 KkVUIEWbCST3nLlYNx+r3s+Ab3Jaiyt7avdzsQjd+PkaAmMXFTHUGjM52lCCf0TX04SttCJ4T2o
 DhsQlaWGXE2CGatyT2H2AxPegcIFJAo7r8rwUuUk2xl/7YhR80qrDIaEfwTBDUybIju8Y79w=
X-Gm-Gg: ASbGnctRZrvk1aZiMd0Qfm0Jc8TdubmlS6BR2RSHUoE/3PsKjA8RS98E9Hi21Hagc/Z
 buBkEe8um3h5wUoBO3IQ8ekrW8U647Crk6qE37fx9V97TXjQ9ai4O9zwzEaiLjGm9OuKnjj0I4R
 Ec/WGQI5kqcKAgpRz405nyfPt1awfNVWFhmyQt2c/urka6OwH0TP4Xz8LPWNIfB2cZMN+PHG4IB
 bAO/l/wrHgLW+84cgBlUhVDbCra08g3sZnimWPjBWMvYbEHIcFgUzKf1ion83O96y4FtTWprxXU
 BQdsqu5OD1on2o0955SlMnraw1ygCgCwaiQwFlt27+4ytJOzHCJrE32jaRl0CG2ZNvwR3chmMqA
 =
X-Received: by 2002:a05:6808:11d1:b0:406:67b7:8b62 with SMTP id
 5614622812f47-40667b79907mr1137216b6e.38.1748448797375; 
 Wed, 28 May 2025 09:13:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7kOaXTktpHw46oOtWRKpilwDLDgGTq8IbcVMN13DgegxQWs9io4EyuZpQO8J6P6zyCxUueg==
X-Received: by 2002:a05:6808:11d1:b0:406:67b7:8b62 with SMTP id
 5614622812f47-40667b79907mr1137186b6e.38.1748448796931; 
 Wed, 28 May 2025 09:13:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32a79e9a765sm3031921fa.10.2025.05.28.09.13.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 09:13:16 -0700 (PDT)
Date: Wed, 28 May 2025 19:13:14 +0300
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
Subject: Re: [PATCH 05/45] drm/msm/dp: add a helper to read mst caps for
 dp_panel
Message-ID: <abxm6ppegxbesl6wztyxg46elhanh2mo5kxn43olbucw37cyon@aeqikyr4ord5>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-5-f8618d42a99a@quicinc.com>
 <aksnudxy2oyojjzwm73i4mulftcxccdsnddcdamypmscn6skpq@ijtp7x76m3pt>
 <df3807e5-c381-4440-be64-9bd49a2ecd9d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df3807e5-c381-4440-be64-9bd49a2ecd9d@quicinc.com>
X-Proofpoint-GUID: febv2kyEgeGQcaSfs5j17nqoM6zTtCBA
X-Authority-Analysis: v=2.4 cv=FuAF/3rq c=1 sm=1 tr=0 ts=6837361e cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=_S4K8tOYiQSLrvZx2BEA:9 a=CjuIK1q_8ugA:10
 a=rBiNkAWo9uy_4UTK5NWh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: febv2kyEgeGQcaSfs5j17nqoM6zTtCBA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE0MSBTYWx0ZWRfXxocNe0SXKsKu
 0MbY5zTLeziJG5tGnwTZAGqTL1VKOpg8MMNgnkHcse2+TA3XncLyPxRtpYxao94ynULvfur6qlg
 vXhA9MBOBzTrGBMrY2l3ivz5rmSPJkM9CYyQ1TDDHuYfpZ3u8lLh7b1O+iAs9UJ7WUtNNKxg9pz
 bh0bvuKjFEB3pvL7LNM6Rw1ygYngKJOc9BlrzKXbX/MGbERGqSWsizwtXLpwu9PtF103Q7hKEsu
 loe6vGo+ZC4d8M0lbvcLNpRrM6KCx45qhn/yGlQrVgklav39OoMZC5oCHv0KjSc+EAsadPllrnz
 +JG/PT60AWjvV+PNpaBKmT0SqopBrJupEz15V6sjK/lNsd6x21dpUJI2n+k1n/8NRLJHMdjlJ6i
 Xp2Ln1h59JiOxcANrAMj1Y2AQVIkdHXMn3J7MnBqltf9My8KR5LpPOmkMoP47kB1wqUNTkNj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_08,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

On Mon, May 26, 2025 at 08:26:47PM +0800, Yongxing Mou wrote:
> 
> 
> On 2024/12/6 16:52, Dmitry Baryshkov wrote:
> > On Thu, Dec 05, 2024 at 08:31:36PM -0800, Abhinav Kumar wrote:
> > > Add a helper to check whether a dp_panel is mst capable.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_aux.h   |  1 +
> > >   drivers/gpu/drm/msm/dp/dp_panel.c | 14 ++++++++++++++
> > >   drivers/gpu/drm/msm/dp/dp_panel.h |  1 +
> > >   3 files changed, 16 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_aux.h b/drivers/gpu/drm/msm/dp/dp_aux.h
> > > index 39c5b4c8596ab28d822493a6b4d479f5f786cdee..cb97a73cdd6ea74b612053bec578247a42214f23 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_aux.h
> > > +++ b/drivers/gpu/drm/msm/dp/dp_aux.h
> > > @@ -8,6 +8,7 @@
> > >   #include "dp_catalog.h"
> > >   #include <drm/display/drm_dp_helper.h>
> > > +#include <drm/display/drm_dp_mst_helper.h>
> > >   int msm_dp_aux_register(struct drm_dp_aux *msm_dp_aux);
> > >   void msm_dp_aux_unregister(struct drm_dp_aux *msm_dp_aux);
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> > > index d277e9b2cbc03688976b6aa481ee724b186bab51..172de804dec445cb08ad8e3f058407f483cd6684 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> > > @@ -108,6 +108,20 @@ static u32 msm_dp_panel_get_supported_bpp(struct msm_dp_panel *msm_dp_panel,
> > >   	return min_supported_bpp;
> > >   }
> > > +bool msm_dp_panel_read_mst_cap(struct msm_dp_panel *msm_dp_panel)
> > > +{
> > > +	struct msm_dp_panel_private *panel;
> > > +
> > > +	if (!msm_dp_panel) {
> > > +		DRM_ERROR("invalid input\n");
> > > +		return 0;
> > > +	}
> > > +
> > > +	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
> > > +
> > > +	return drm_dp_read_mst_cap(panel->aux, msm_dp_panel->dpcd);
> > 
> > So, it's a one-line wrapper. Do we actually need it?
> It beacuse the point of aux is in msm_dp_panel_private, so if we want to
> call drm_dp_read_mst_cap in other file, we need this wrapper.

It is being used from dp_display, which also ->aux pointer.

> > 
> > > +}
> > > +
> > >   int msm_dp_panel_read_link_caps(struct msm_dp_panel *msm_dp_panel,
> > >   				struct drm_connector *connector)
> > >   {
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> > > index 7a38655c443af597c84fb78c6702b2a3ef9822ed..363b416e4cbe290f9c0e6171d6c0c5170f9fea62 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> > > +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> > > @@ -67,6 +67,7 @@ int msm_dp_panel_get_modes(struct msm_dp_panel *msm_dp_panel,
> > >   		struct drm_connector *connector);
> > >   void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel);
> > >   void msm_dp_panel_tpg_config(struct msm_dp_panel *msm_dp_panel, bool enable);
> > > +bool msm_dp_panel_read_mst_cap(struct msm_dp_panel *dp_panel);
> > >   /**
> > >    * is_link_rate_valid() - validates the link rate
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry
