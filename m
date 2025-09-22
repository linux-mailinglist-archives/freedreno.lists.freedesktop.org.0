Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85513B91DE7
	for <lists+freedreno@lfdr.de>; Mon, 22 Sep 2025 17:13:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A8AF10E1CC;
	Mon, 22 Sep 2025 15:13:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ch1JZDV+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E34510E48A
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 15:13:13 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M9G4t1022699
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 15:13:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=6L9xQwPvNyqamZukUXThzBL99kp13JUWCh+pkhXMJs8=; b=Ch
 1JZDV+r8a/WgnKlOpaq43F9UXMaE7QwFKQFTc49dqHxNTCmTe3l+dGBTQN5/TPmM
 x39TiYYB18ZZuaM9vNEeWb+M4uOXoYafbF7ZwTD7q/BE14Sa6+odQIFtpSeUm101
 3x+01mzW4QBpFYlbrWORWQakdsbwSJ6C8MLXe1PfNGvdmD5BC/CS/HvHJOXlcXXN
 1rqTpD/saU4PxETzDxSYubavNCNOwKaJ1cMvEytGRhI6JAs8JszfAQgdtIakwr+7
 AC69IdlsFgwwKw91ZpvC++2o22NFJVAh75nm0JaLE4hWAbGUVeyjIWi9ua6WxXtU
 2cZJ8TH7K/nR9ngV2g3A==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3ny8yxc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 15:13:12 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-32aed063939so4572826fac.2
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 08:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758553991; x=1759158791;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6L9xQwPvNyqamZukUXThzBL99kp13JUWCh+pkhXMJs8=;
 b=WCGbBchyt11sv1ML8Yjl3XKEGFJ9Fn4MuqBbE3p+eIfWY1dkYbaL4FfLIKNFMKN1Vw
 p85FD3biFyRUR8vx/nZSt0FaowdubvtLW36COJcHMZ16cqTHXNpYFEWvKvUSL3yTYTA2
 r2JEvGouuLSkp/qpuaud0lYCJdM587qIxRzpq7mU/gCk32c3tycO+2UflTriHNr4n4WR
 4EuF9ux0MKsjaSPfPBAJZajJOAN1YXouGg/2mkTfFtee0vteq0cmirid9Mj8TqxCYnr7
 7RGqSWK4ZXhzmwIFZajt0UfNDvZr7gl2+ZQO2ZGbwWnhcaCOLwFCaOuWHFktUkflwxfD
 kyAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9aF6kA7ORBadAtRH/7gpaMArt+JBGrvjhOsMZ8PbeRHFpoEiGQN6PpYdDyBnUEot5GNbueZbx4I8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxsu1ZkwkyG/gYT7uOtNI8Y2q8xh2MBVBEiys/1jKkTBxCU6RBG
 XOCwJvaRoVjgBncObzo8Z3RW2iyV9MCOAbzaMfPtDAiiDU30dCxyYR527TiL25FgR0EGcjiwIr0
 4tI8nol4twj0wwZuvXVfmbGOrDnpBm9PkX8FRNF0uaGWVAJcHziFcckn5p/tHSSdS87I8H02Nqd
 4A8H+IXH8XDWfk0IDZ3hpUFqG2ZLnaFNbuhM6vvtzQelmESQ==
X-Gm-Gg: ASbGncsHxxOqn8tJr2OGHot3XSOyXi7UukG6jvkAsPt/buIV95p2yscKWklNdGG16go
 IptEinUIVATldtDag++vOpsv3vb9H9GhVKXmqC088D3JKG84POVSz6MN5Pr2qMH8mBOGPz2dPeV
 pwt5BihUI2NGNhbOLGHd78Dp/wzz9sr92wCC38+yeJV9VbGudRcO9R
X-Received: by 2002:a05:6870:d203:b0:321:27af:4b0 with SMTP id
 586e51a60fabf-33bb387a8efmr7066543fac.21.1758553991295; 
 Mon, 22 Sep 2025 08:13:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeI3VUzLWw/6kf7cmjW8nkegRTNOSrOJHdfgWLSr9Z07F+QepvdikPR1+KMJ0NepSDMgedO2i6ynxIGcy1040=
X-Received: by 2002:a05:6870:d203:b0:321:27af:4b0 with SMTP id
 586e51a60fabf-33bb387a8efmr7066517fac.21.1758553990880; Mon, 22 Sep 2025
 08:13:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-14-eae6681f4002@oss.qualcomm.com>
 <j7ooyi5vih6ofnjigdgj6uk3ycutugunpm5pu5zf55pu5ua6r2@agg73zakjicn>
In-Reply-To: <j7ooyi5vih6ofnjigdgj6uk3ycutugunpm5pu5zf55pu5ua6r2@agg73zakjicn>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 08:13:00 -0700
X-Gm-Features: AS18NWDsjwQT4-UMvgr22Kwg3NRpxj1iGVDde1kRYPcz2iKyW9TnGKIpG41ve0w
Message-ID: <CACSVV00Bat6LE=joM+Wh3HnC1=c3_Y=crxUGdhLQWxxpZ17Q3g@mail.gmail.com>
Subject: Re: [PATCH v5 14/14] drm/msm/dp: Add support for lane mapping
 configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=EuPSrTcA c=1 sm=1 tr=0 ts=68d16788 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=Ck2O2MNpSjHhtJkipUsA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-GUID: 9s7hWdj-8j4WdzHnfZ_QNDHcmua7w0i3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA5MCBTYWx0ZWRfX2GHhMqUMRlou
 S3zQT9G0qA8c3nNfUEk905GB2jKeSFLvZHJnMfhKx8R2v8VKvmkNyEDAQy4UJVwg8WhWiezjtkI
 h8L/KyJc+V0GQppZNpPQnMIOzfbNwqQqeGzUtME9pyyK/jPpEG/pFh7REkYvZ36qnUeA0+rNjyQ
 HUGmZ7U+MC1I9C6LZQUHGBncHFsA2Jov2GhJ4L/fmzupyQrt4fk/wLRuGya/iujaNie3x3sS7Se
 unRkvPxRP8SfuB2djnbkyOjzjeaXms8b8mnoBdUEq7oLQlwz0XNGFnMQIauqqkn5XagzLsG3m47
 RS9iQHNizzmDMhWQLb9ia5C+JyIx/zjnfGRMhzoLJcB2SFlNIkn+V0k8VhAyR1+BQUp4OcJBlEJ
 /I9NryrP
X-Proofpoint-ORIG-GUID: 9s7hWdj-8j4WdzHnfZ_QNDHcmua7w0i3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220090
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, Sep 19, 2025 at 11:35=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Fri, Sep 19, 2025 at 10:24:31PM +0800, Xiangxu Yin wrote:
> > QCS615 platform requires non-default logical-to-physical lane mapping d=
ue
> > to its unique hardware routing. Unlike the standard mapping sequence
> > <0 1 2 3>, QCS615 uses <3 2 0 1>, which necessitates explicit
> > configuration via the data-lanes property in the device tree. This ensu=
res
> > correct signal routing between the DP controller and PHY.
> >
> > For partial definitions, fill remaining lanes with unused physical lane=
s
> > in ascending order.
> >
> > Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/dp/dp_ctrl.c | 10 +++----
> >  drivers/gpu/drm/msm/dp/dp_link.c | 60 ++++++++++++++++++++++++++++++++=
++++++++
> >  drivers/gpu/drm/msm/dp/dp_link.h |  1 +
> >  3 files changed, 66 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/=
dp_link.c
> > index 2aeb3ecf76fab2ee6a9512b785ca5dceebfc3964..34a91e194a124ef5372f133=
52f7b3513aa88da2a 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_link.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> > @@ -1236,6 +1236,61 @@ static u32 msm_dp_link_link_frequencies(struct d=
evice_node *of_node)
> >       return frequency;
> >  }
> >
> > +/*
> > + * Always populate msm_dp_link->lane_map with 4 lanes.
> > + * - Use DTS "data-lanes" if present; otherwise fall back to default m=
apping.
> > + * - For partial definitions, fill remaining entries with unused lanes=
 in
> > + *   ascending order.
> > + */
> > +static int msm_dp_link_lane_map(struct device *dev, struct msm_dp_link=
 *msm_dp_link)
> > +{
> > +     struct device_node *of_node =3D dev->of_node;
> > +     struct device_node *endpoint;
> > +     int cnt =3D msm_dp_link->max_dp_lanes;
> > +     u32 tmp[DP_MAX_NUM_DP_LANES];
> > +     u32 map[DP_MAX_NUM_DP_LANES] =3D {0, 1, 2, 3}; /* default 1:1 map=
ping */
> > +     bool used[DP_MAX_NUM_DP_LANES] =3D {false};
> > +     int i, j =3D 0, ret =3D -EINVAL;
> > +
> > +     endpoint =3D of_graph_get_endpoint_by_regs(of_node, 1, -1);
> > +     if (endpoint) {
> > +             ret =3D of_property_read_u32_array(endpoint, "data-lanes"=
, tmp, cnt);
> > +             if (ret)
> > +                     dev_dbg(dev, "endpoint data-lanes read failed (re=
t=3D%d)\n", ret);
> > +     }
> > +
> > +     if (ret) {
> > +             ret =3D of_property_read_u32_array(of_node, "data-lanes",=
 tmp, cnt);
> > +             if (ret) {
> > +                     dev_info(dev, "data-lanes not defined, set to def=
ault\n");
> > +                     goto out;
> > +             }
> > +     }
> > +
> > +     for (i =3D 0; i < cnt; i++) {
> > +             if (tmp[i] >=3D DP_MAX_NUM_DP_LANES) {
> > +                     dev_err(dev, "data-lanes[%d]=3D%u out of range\n"=
, i, tmp[i]);
> > +                     return -EINVAL;
> > +             }
> > +             used[tmp[i]] =3D true;
> > +             map[i] =3D tmp[i];
> > +     }
> > +
> > +     /* Fill the remaining entries with unused physical lanes (ascendi=
ng) */
> > +     for (i =3D cnt; i < DP_MAX_NUM_DP_LANES && j < DP_MAX_NUM_DP_LANE=
S; j++) {
>
> Nit: i =3D cnt, j =3D 0; Don't init loop variables at the top of the
> function.

These days we can party like it's c99 and declare loop variables
inside the for(), instead of at the top of the function.  My
preference is to do so, unless the loop variable is used after the
loop.

BR,
-R

> Other than that:
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
>
> > +             if (!used[j])
> > +                     map[i++] =3D j;
> > +     }
> > +
> > +out:
> > +     if (endpoint)
> > +             of_node_put(endpoint);
> > +
> > +     dev_dbg(dev, "data-lanes count %d <%d %d %d %d>\n", cnt, map[0], =
map[1], map[2], map[3]);
> > +     memcpy(msm_dp_link->lane_map, map, sizeof(map));
> > +     return 0;
> > +}
> > +
> >  static int msm_dp_link_parse_dt(struct device *dev, struct msm_dp_link=
 *msm_dp_link)
> >  {
> >       struct device_node *of_node =3D dev->of_node;
>
> --
> With best wishes
> Dmitry
