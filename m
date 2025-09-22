Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFAFB939CE
	for <lists+freedreno@lfdr.de>; Tue, 23 Sep 2025 01:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 657AC10E03A;
	Mon, 22 Sep 2025 23:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="D3W6ofxA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1989510E02A
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 23:39:56 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MHZaED008700
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 23:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nyhMdld3iRwlOfrrEDiEApYehLCv9Ntzp5VmwS0Yvcc=; b=D3W6ofxAWgqgKf9U
 ektTvLlg9+CI08ZNS9v2rTbGb4dWAJZr4z5TO6J+XBcpEFCJyZU09pZ7SPaqpNtj
 Oq/wybhLS+QOt2Zly/SnQpdbDVtdvDtXGiyWuh5cN9/OT8qx3H6h++ZllUAIaKy8
 i6ND3+wi0UMs9UxFX1uDEZ9oknTZWREMtrm3T5KAyZeWHT+qRbqA3SrB1ChAoII5
 Ikt16RUh1dsBoIRh4NY1DSzbzs6FfCFeqrCHf9tzMevSzA4fyDA/f0eZHhZwKpXR
 ECE1TgkJxCqtDZAqeF6sRHfAnqwGi0n9H6KRQcgGqDPwBMiwoMsgleo44NNYJ6D0
 XGGRcw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bb07gvv3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 23:39:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-79a3c16b276so70117726d6.0
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 16:39:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758584394; x=1759189194;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nyhMdld3iRwlOfrrEDiEApYehLCv9Ntzp5VmwS0Yvcc=;
 b=kvAPIxwON0A8D5fe/rC4Gkkc5OLr6NRjMYFHSaYFajjjYaZtZkPTCujKkZvRMdWwf1
 Ls6tceAztYkBD6xuZpInznwYxcteHVLrgkPNfZf+AmyKW8YqbwTugk+CD6eX7FJs2q34
 Fjj3hlpjjtJunvLR66f5inNt5VdMpQwyKz2SdZIIGzEVQfPkxwwfGHsj2CNfkkiwwq92
 Xnosl6QeGSeatucUfKjz9dlo412lozdMT1Cipk/pSEVeEXIM6290T/8uloY1OH6blsHx
 STRit+t0B4wTHCsCEyidWgW16KvDbc2vXcByjTiE7Gk2DyaMeeuw5vpHvwjcgOOkgvJq
 nExw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQ3z90Aoy3sggjMrxhg2Q6pYqCcTQqePyvrD6hKi8Ya9wa1zpb8zVVbPaXbBamNvNXL9sxQSse/2k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yya9Eun935Jzg4rcwrhtHzSL7HmtvkPfznCf4PPKycIwNzuoLkC
 uqjVTO/G+xgkOJCeYNm90RRfqPkYOqvgJ/a+a74EhHp6d7UFecocnqkV0zjqAsIGvBDkoxsKHeT
 e8Wsj1WvFBy0qD2+C/f67MVfgOluQt9O4JB+MWjPcjcKIwrg65Dp7JlUuIfakRKtl01Npj9o=
X-Gm-Gg: ASbGncugHt/dKnDYqZ+juUvpQ1O2j7TF83L/T0lY0jixsOJi5amzD0O2iLAq/lxrAQ0
 J86sOMrCAQIB9w9NLn++6ayiCwxosWQQgug1dj+/ICl9oo39TAmdC69cjwHRW3G4ajkh7N/xkQZ
 NFaw4tHxW1lw/2eX9J/jFD+DZJhZmhlsKz+kTYxSBDB73RLLltIrkEwXaYxr9fifjV4UEdJUGDF
 +j7BJC5cLYuR1pfVSshV745nVkPVYYFHGjs3QH9jOgWpSWLTlQNs3ULk6ZvGNE1KTlumIkal3eD
 sdlTpdWxvQJM9Ui4a+pbEIgYYDX2web9f5BYJxMXDsLA38XBw2pJ4rL0sqSm7qGc831AiwJ1M/Q
 WNckbw5t5dK6FgxKZntU5Z8qLHsgXY1Aaz9XNij0XbLwzJadhhi0z
X-Received: by 2002:a05:6214:d62:b0:783:aeed:f591 with SMTP id
 6a1803df08f44-7e6ff32ee4fmr9470146d6.11.1758584394101; 
 Mon, 22 Sep 2025 16:39:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjwGj4dPuDuQgAOpaSc71GX0OUwUXDROsU0ay7TcyRk+yHVyKF7m4w7U22p4wZjnkRg5+6gg==
X-Received: by 2002:a05:6214:d62:b0:783:aeed:f591 with SMTP id
 6a1803df08f44-7e6ff32ee4fmr9469836d6.11.1758584393538; 
 Mon, 22 Sep 2025 16:39:53 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-57c5687103fsm1861749e87.52.2025.09.22.16.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 16:39:52 -0700 (PDT)
Date: Tue, 23 Sep 2025 02:39:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v5 14/14] drm/msm/dp: Add support for lane mapping
 configuration
Message-ID: <t4x7okzjvh5ltyoniwlreoyy76735igtnxpeohpbojn4hkqk4q@v3ayfjrkez3e>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-14-eae6681f4002@oss.qualcomm.com>
 <j7ooyi5vih6ofnjigdgj6uk3ycutugunpm5pu5zf55pu5ua6r2@agg73zakjicn>
 <CACSVV00Bat6LE=joM+Wh3HnC1=c3_Y=crxUGdhLQWxxpZ17Q3g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV00Bat6LE=joM+Wh3HnC1=c3_Y=crxUGdhLQWxxpZ17Q3g@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=HJnDFptv c=1 sm=1 tr=0 ts=68d1de4b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=yZMGBzM-AMQHzKZg3z0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: mEg9zBV7xuZjUB92xRATULo79sncjGZI
X-Proofpoint-GUID: mEg9zBV7xuZjUB92xRATULo79sncjGZI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDE3MiBTYWx0ZWRfX+k2mXjOeANCH
 m+72Y3KcpnRbTT09H/2NejfrVGY32s+YV6cwPB7lzcCLqQEp4clLH8sJifW62Lb11DMYmR2YUMM
 ndeVVfaEfzd6AAPktx2sgQoV9vu17CzblQTOpdMcSgjwpXP/iegb8aT9Ceba+1M/tmG+KpPeIFj
 s1YSFt7SRUMa4D5nx+DXJ40kNLdWnmVBmyuIecwROXReQdWsZssVLn1ovxfvf0cPhM8F04IpbK2
 fNu++40InDFplL9M1zV8qZv6OdtDSI9eXYC+bBb5FfDnf9g/bKNhgmBMxALcBHzO8AFYxbj/ZqL
 IxIN2ErEw3hF0N6VH5B8eA6GtzwbqeigA/VtuRj8qHulSezm/rrz7AFTdOvwbnmJadYvbuXkyZq
 kO8n39Hb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_05,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220172
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

On Mon, Sep 22, 2025 at 08:13:00AM -0700, Rob Clark wrote:
> On Fri, Sep 19, 2025 at 11:35 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Fri, Sep 19, 2025 at 10:24:31PM +0800, Xiangxu Yin wrote:
> > > QCS615 platform requires non-default logical-to-physical lane mapping due
> > > to its unique hardware routing. Unlike the standard mapping sequence
> > > <0 1 2 3>, QCS615 uses <3 2 0 1>, which necessitates explicit
> > > configuration via the data-lanes property in the device tree. This ensures
> > > correct signal routing between the DP controller and PHY.
> > >
> > > For partial definitions, fill remaining lanes with unused physical lanes
> > > in ascending order.
> > >
> > > Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> > > ---
> > >  drivers/gpu/drm/msm/dp/dp_ctrl.c | 10 +++----
> > >  drivers/gpu/drm/msm/dp/dp_link.c | 60 ++++++++++++++++++++++++++++++++++++++++
> > >  drivers/gpu/drm/msm/dp/dp_link.h |  1 +
> > >  3 files changed, 66 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> > > index 2aeb3ecf76fab2ee6a9512b785ca5dceebfc3964..34a91e194a124ef5372f13352f7b3513aa88da2a 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_link.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> > > @@ -1236,6 +1236,61 @@ static u32 msm_dp_link_link_frequencies(struct device_node *of_node)
> > >       return frequency;
> > >  }
> > >
> > > +/*
> > > + * Always populate msm_dp_link->lane_map with 4 lanes.
> > > + * - Use DTS "data-lanes" if present; otherwise fall back to default mapping.
> > > + * - For partial definitions, fill remaining entries with unused lanes in
> > > + *   ascending order.
> > > + */
> > > +static int msm_dp_link_lane_map(struct device *dev, struct msm_dp_link *msm_dp_link)
> > > +{
> > > +     struct device_node *of_node = dev->of_node;
> > > +     struct device_node *endpoint;
> > > +     int cnt = msm_dp_link->max_dp_lanes;
> > > +     u32 tmp[DP_MAX_NUM_DP_LANES];
> > > +     u32 map[DP_MAX_NUM_DP_LANES] = {0, 1, 2, 3}; /* default 1:1 mapping */
> > > +     bool used[DP_MAX_NUM_DP_LANES] = {false};
> > > +     int i, j = 0, ret = -EINVAL;
> > > +
> > > +     endpoint = of_graph_get_endpoint_by_regs(of_node, 1, -1);
> > > +     if (endpoint) {
> > > +             ret = of_property_read_u32_array(endpoint, "data-lanes", tmp, cnt);
> > > +             if (ret)
> > > +                     dev_dbg(dev, "endpoint data-lanes read failed (ret=%d)\n", ret);
> > > +     }
> > > +
> > > +     if (ret) {
> > > +             ret = of_property_read_u32_array(of_node, "data-lanes", tmp, cnt);
> > > +             if (ret) {
> > > +                     dev_info(dev, "data-lanes not defined, set to default\n");
> > > +                     goto out;
> > > +             }
> > > +     }
> > > +
> > > +     for (i = 0; i < cnt; i++) {
> > > +             if (tmp[i] >= DP_MAX_NUM_DP_LANES) {
> > > +                     dev_err(dev, "data-lanes[%d]=%u out of range\n", i, tmp[i]);
> > > +                     return -EINVAL;
> > > +             }
> > > +             used[tmp[i]] = true;
> > > +             map[i] = tmp[i];
> > > +     }
> > > +
> > > +     /* Fill the remaining entries with unused physical lanes (ascending) */
> > > +     for (i = cnt; i < DP_MAX_NUM_DP_LANES && j < DP_MAX_NUM_DP_LANES; j++) {
> >
> > Nit: i = cnt, j = 0; Don't init loop variables at the top of the
> > function.
> 
> These days we can party like it's c99 and declare loop variables
> inside the for(), instead of at the top of the function.  My
> preference is to do so, unless the loop variable is used after the
> loop.

Ack, works for me too. I think I'm not used for having theese parts of
C99 allowed in the kernel.

-- 
With best wishes
Dmitry
