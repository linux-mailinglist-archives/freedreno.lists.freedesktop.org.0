Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D57AF7C67
	for <lists+freedreno@lfdr.de>; Thu,  3 Jul 2025 17:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84EFB10E890;
	Thu,  3 Jul 2025 15:35:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DLRfFY30";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6976810E890
 for <freedreno@lists.freedesktop.org>; Thu,  3 Jul 2025 15:35:53 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563BWGfe020843
 for <freedreno@lists.freedesktop.org>; Thu, 3 Jul 2025 15:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 koC3pZ0RSk1KCQZ/gO/UjMi13CVI06q9nXn8pDCBKxY=; b=DLRfFY30kn4GY59r
 cxTsdQ8Ga1zVxJUgcfyHT1Yiwl0dZym79jknCeyWv1SMHMsq8iq4+0AeHbKrCtos
 qJ9rGkpGpnHLKtYgb54Ob9w/ELKWI2zg8QNq8qGDgt7aAUZLSM7S7EuppBfW8BFo
 l3mQpF5MBPCHHoBgsyhnMjxP6wufM1py9PKk1r5mudeBKEQT81CdWDOW6/GPPVZp
 wKBU6qsFJXi3GGzrdfO1TRgFV4kRXh6iF28Ii+b2XHxD4XLo97i5rqcBT+xpqL1U
 bQ/8TdQYu/FZU4Sc9EEJpz1heaQ4mUbkaL3sHRNEg+Kj+r2xlkCOakg8PW4inYJc
 MidARg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mhxn7n4f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 03 Jul 2025 15:35:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3132c8437ffso81328a91.1
 for <freedreno@lists.freedesktop.org>; Thu, 03 Jul 2025 08:35:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751556951; x=1752161751;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=koC3pZ0RSk1KCQZ/gO/UjMi13CVI06q9nXn8pDCBKxY=;
 b=YTmme6el6h7ewhbQdkp5FWaeNyHFMXU0EWi3wrVipvKzRiw16ojxxiknibQw/Tdai5
 p05bHm+wFEWWDJifHYGNXjAcg15HHnQIt1xqgEJWR25+Al6uhMsHRzlmCuQBBGKNZVux
 GnhGYxoZLLh+gt6sCzryFUkfUL0to7X1TPSr/d8qPzMJC/vvJGNYA8OUasWWFtachROX
 qDwQQ6NzyEko7j1pqiHg1pOoyG4DSiMHRcQJl43DxkLx10+4zg5IciDSUEgCkKPY3rMf
 uagmeVvh9ofdjPlHCdRyXFmx4t2gHSOG5pwZjQo2DHfYszRuUrICm3qwjDk+DaMj7tCr
 sdMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUb2t+97Kab7r+SqUVaxyLgMX8ryGlqgZSCFbb7gfxLMJpuNyGZR9+dXrhxYzvvuOrYre4vVYMCPVM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQYNh7CShqi/vM1Tls34RcRq5jyxNadTr/VGAF3rd4E7YMMyOG
 daSc61MII7ztXqQkPmnYQxgjC2EUpqmOELBRaiSBe2WOALLokW2YxotET/krAmJFjzgBYsgDcXu
 dtFuKwAtmyVCkaKeY1n4UiW/J4i+7655bFVUfdoArXMNUfP0lfTxA/CdHIvWE1TQRNzDEyS9gtm
 7Hn9j1n+a8semzH5sGUs8G3qtEYNJBcyIKTihoQJ1APHF7Rg==
X-Gm-Gg: ASbGncsa29xIv6wV+5KgmlgW31Q1tckS0ib8q6/mDZRh1s1Md/b8U5vPj0Rt9ZYDMxv
 Rau/2dsmi0RANdPw09h4HYjf5WGigIQUsWejJbJv9pcgQEGhiPzYesgQhGe6N589+D0vXtcnjR6
 DtKA==
X-Received: by 2002:a17:90a:dfc4:b0:312:959:dc4d with SMTP id
 98e67ed59e1d1-31a9d5c4ae1mr5421447a91.7.1751556950778; 
 Thu, 03 Jul 2025 08:35:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvuJgFL8JwbaJ7/GCn97YCPbWJpecG7LgMwKmZOcHJuPDhOratYeRV9N4v3vpyid9ST48jTlg9XVMdv6Vmtvo=
X-Received: by 2002:a17:90a:dfc4:b0:312:959:dc4d with SMTP id
 98e67ed59e1d1-31a9d5c4ae1mr5421398a91.7.1751556950244; Thu, 03 Jul 2025
 08:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250629085036.765397-1-loic.poulain@oss.qualcomm.com>
 <yafvivvzvcuyopyisxbkb4cqa3cmv4uzn7df34pwk4kqg2r55n@wx6spgecaw6d>
 <CAFEp6-2Z2CLD8AW475AH7FkBrtysXpfnAtWryHWRN+Noh2DZGg@mail.gmail.com>
In-Reply-To: <CAFEp6-2Z2CLD8AW475AH7FkBrtysXpfnAtWryHWRN+Noh2DZGg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 3 Jul 2025 18:35:39 +0300
X-Gm-Features: Ac12FXwu7JNM6-UBggtafyhttBy94zRGg6G9gbFZqb1KmqG8QkrvMSfdnj3vz7Y
Message-ID: <CAO9ioeV2A6nSksC=gSc6cPwqL+-DtvGTjZVrQ19udD+HhWZFKg@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] drm/msm/dsi: Fix 14nm DSI PHY PLL Lock issue
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com,
 sean@poorly.run, marijn.suijten@somainline.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEyOSBTYWx0ZWRfX6lys50RwVO8Q
 QHTmZLILEWCqKnaMeDhAGj2YL6MG5cW+ZezSuJUMZtyiVQyurMHqgiqtwqkb4vJu6ixCwDGs0o5
 jcWFoOgUUMJsB2LBqofAk83rb0yggg9Bmq6sR/UkYn2jUF3DbVibKctSZYWKA8etIxhMsKTz9CF
 BqkrP6K1SlTBjyoInAed2Ys46TXJjlnKaDpLpQeTVwEkDmZKuvWEAaPCpNJ1VdTX3UjSE29s218
 de+/G8qBFatVV36uPjLoLUxyUR5KC/bekTLvCekpB8iRa/b3/krSozjL9Y/Xnn52BATXdnZqKcq
 OkfD9D91HHlqsohBlsAwULPlyCgKClY3reYtwDSMO44bdb75EbAHDs+O3hLvwUpapqtTEwT9Zoy
 /iNTYzf1uY2dL7r7w+8JADW3MOkRYEXAjw5yIfDXIFMbHU5bmxBNZhiV9pBtHiYR8tCiSzRN
X-Authority-Analysis: v=2.4 cv=EbvIQOmC c=1 sm=1 tr=0 ts=6866a358 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=Ln6QiOcq6eY1s8CMCiUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: glmlH2iV4jprJA-CXxsCyzvHPmTlwsv6
X-Proofpoint-GUID: glmlH2iV4jprJA-CXxsCyzvHPmTlwsv6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030129
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

On Thu, 3 Jul 2025 at 17:28, Loic Poulain <loic.poulain@oss.qualcomm.com> w=
rote:
>
> Hi Dmitry,
>
> On Sun, Jun 29, 2025 at 4:57=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Sun, Jun 29, 2025 at 10:50:36AM +0200, Loic Poulain wrote:
> > > To configure and enable the DSI PHY PLL clocks, the MDSS AHB clock mu=
st
> > > be active for MMIO operations. Typically, this AHB clock is enabled a=
s
> > > part of the DSI PHY interface enabling (dsi_phy_enable_resource).
> > >
> > > However, since these PLL clocks are registered as clock entities, the=
y
> > > can be enabled independently of the DSI PHY interface, leading to
> > > enabling failures and subsequent warnings:
> > >
> > > ```
> > > msm_dsi_phy 5e94400.phy: [drm:dsi_pll_14nm_vco_prepare] *ERROR* DSI P=
LL lock failed
> > > ------------[ cut here ]------------
> > > dsi0pllbyte already disabled
> > > WARNING: CPU: 3 PID: 1 at drivers/clk/clk.c:1194 clk_core_disable+0xa=
4/0xac
> > > CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Tainted:
> > > Tainted: [W]=3DWARN
> > > Hardware name: Qualcomm Technologies, Inc. Robotics RB1 (DT)
> > > pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> > > [...]
> > > ```
> > >
> > > This issue is particularly prevalent at boot time during the disablin=
g of
> > > unused clocks (clk_disable_unused()) which includes enabling the pare=
nt
> > > clock(s) when CLK_OPS_PARENT_ENABLE flag is set (this is the case for=
 the
> > > 14nm DSI PHY PLL consumers).
> > >
> > > To resolve this issue, we move the AHB clock as a PM dependency of th=
e DSI
> > > PHY device (via pm_clk). Since the DSI PHY device is the parent of th=
e PLL
> > > clocks, this resolves the PLL/AHB dependency. Now the AHB clock is en=
abled
> > > prior the PLL clk_prepare callback, as part of the runtime-resume cha=
in.
> > >
> > > We also eliminate dsi_phy_[enable|disable]_resource functions, which =
are
> > > superseded by runtime PM.
> > >
> > > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > > ---
> > >  v2: Move AHB clock into a proper PM dep instead of manually toggling=
 it
> > >      from the PLL clock driver.
> > >
> > >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 65 +++++++++++--------------=
--
> > >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h |  1 -
> > >  2 files changed, 25 insertions(+), 41 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/=
msm/dsi/phy/dsi_phy.c
> > > index 5973d7325699..015cb579c669 100644
> > > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > > @@ -5,6 +5,8 @@
> > >
> > >  #include <linux/clk-provider.h>
> > >  #include <linux/platform_device.h>
> > > +#include <linux/pm_clock.h>
> > > +#include <linux/pm_runtime.h>
> > >  #include <dt-bindings/phy/phy.h>
> > >
> > >  #include "dsi_phy.h"
> > > @@ -511,30 +513,6 @@ int msm_dsi_cphy_timing_calc_v4(struct msm_dsi_d=
phy_timing *timing,
> > >       return 0;
> > >  }
> > >
> > > -static int dsi_phy_enable_resource(struct msm_dsi_phy *phy)
> > > -{
> > > -     struct device *dev =3D &phy->pdev->dev;
> > > -     int ret;
> > > -
> > > -     ret =3D pm_runtime_resume_and_get(dev);
> > > -     if (ret)
> > > -             return ret;
> > > -
> > > -     ret =3D clk_prepare_enable(phy->ahb_clk);
> > > -     if (ret) {
> > > -             DRM_DEV_ERROR(dev, "%s: can't enable ahb clk, %d\n", __=
func__, ret);
> > > -             pm_runtime_put_sync(dev);
> > > -     }
> > > -
> > > -     return ret;
> > > -}
> > > -
> > > -static void dsi_phy_disable_resource(struct msm_dsi_phy *phy)
> > > -{
> > > -     clk_disable_unprepare(phy->ahb_clk);
> > > -     pm_runtime_put(&phy->pdev->dev);
> > > -}
> > > -
> > >  static const struct of_device_id dsi_phy_dt_match[] =3D {
> > >  #ifdef CONFIG_DRM_MSM_DSI_28NM_PHY
> > >       { .compatible =3D "qcom,dsi-phy-28nm-hpm",
> > > @@ -696,24 +674,30 @@ static int dsi_phy_driver_probe(struct platform=
_device *pdev)
> > >       if (ret)
> > >               return ret;
> > >
> > > -     phy->ahb_clk =3D msm_clk_get(pdev, "iface");
> > > -     if (IS_ERR(phy->ahb_clk))
> > > -             return dev_err_probe(dev, PTR_ERR(phy->ahb_clk),
> > > -                                  "Unable to get ahb clk\n");
> > > +     platform_set_drvdata(pdev, phy);
> > >
> > > -     ret =3D devm_pm_runtime_enable(&pdev->dev);
> > > +     ret =3D devm_pm_runtime_enable(dev);
> > >       if (ret)
> > >               return ret;
> > >
> > > -     /* PLL init will call into clk_register which requires
> > > -      * register access, so we need to enable power and ahb clock.
> > > -      */
> > > -     ret =3D dsi_phy_enable_resource(phy);
> > > +     ret =3D devm_pm_clk_create(dev);
> > >       if (ret)
> > >               return ret;
> > >
> > > +     ret =3D pm_clk_add(dev, "iface");
> >
> > This will break booting the kernel with some old DTS (before 6.0), wher=
e
> > we had iface_clk as a DSI PHY clock. Please document it in the commit
> > message.
>
> Do we want to preserve backward compatibility and introduce some sort
> of msm_pm_clk_add to handle both?

Just state that it breaks compat with kernels before 6.0. Then if
anybody has concerns, they can stand up.



--=20
With best wishes
Dmitry
