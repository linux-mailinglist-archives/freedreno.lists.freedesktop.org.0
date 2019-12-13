Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 409C811EC99
	for <lists+freedreno@lfdr.de>; Fri, 13 Dec 2019 22:07:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC61C6ED36;
	Fri, 13 Dec 2019 21:07:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 924 seconds by postgrey-1.36 at gabe;
 Fri, 13 Dec 2019 21:07:06 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4EE96ED36
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2019 21:07:06 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MvbO4-1hpQC52QtS-00scVY; Fri, 13 Dec 2019 21:50:19 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: y2038@lists.linaro.org,
	linux-kernel@vger.kernel.org
Date: Fri, 13 Dec 2019 21:49:09 +0100
Message-Id: <20191213204936.3643476-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:uP+kiANpOGJCAXUng4IDyXrHx7+oq5wNuUSCR2Raiw5aTIDdJGg
 5j4AA9RZwtRFpSlQJZR8HotU54Xfp+erI4gckXGaucpRhzYx4dcdDnO9RE7chr7C+S6QsS1
 hz8jSvfht0kOIuwI+U39is0hUz6MZ6pZnETpaFRYUgmMegCz9cluYoQw5GzMKND6Vlt+MoP
 vuRLets3Xp1M/VHl6bYkg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DKceCR2a01s=:3hiWOstUQ2W+K8g3Na1IbD
 jXBlEcKMtwC7Y+i5A5HxcmPjWxB5nmsttkVfwVEOMHaQsTFUtaP4oeDWzGDplTaT/AunxerXd
 yVeEyk6wDqM15d8fm5FQfo0tHqlw0iUZlYwjdZ5ZXpyFLbAb85Q9x8ioYGXjApOs/RTTI5MbZ
 n0yLQDPmDXklnqPYdBWipqwTpbhD/NnvppHjbAD0q0U6G03W6qrzyyJxMHFxKnrK1rmy7FZe5
 NrYqFkECXlWvPngyWRLXfFThbmt4YCQEW6x2RiEZLzafpltLFK1daccOaFny2zWIwVWcoaLAH
 wAfyGocQGItNFBHSUj9e0CpYlgpD0BmDWssWYraEBRLn+HXGTGJyhhoEJl4fkOzPeGKqkJEI2
 +3NQhas/AairLYreLkXyHQselayQRqWmqpbhyMyqMz6tKnb8xdtOD6n1bdNnHMV8niaReSbVo
 pe8JkjvXfo7uvSm8wQaaWly6URjDKl/95Il1bY3Lod81jlJxmUPxlWutSnMCj9p4mxPhbOBS/
 uVwX0E3/xlJQQ4ec1BPP/b2rS1nhNIA+mlusogdRjDhrNCZ3+zkzAPpu1e2v7rjcXVF9Qmwun
 5KNuuvqqzwbQgUa7TjVxsRAhcQnaHnJ2Wo/0kS9UJIBXRVLiCdFpFhR1qHl+miYwwIGFLypgr
 t8l9WcAVtA8U/c0QxiAAdTwS6Xfi6BUw4oORdw9uD9g/2kwaSXZHyMMgizESV09U8Al+tmnPY
 RTBgDLmkxJLKTIrzR+firAheYcH1HzE1DG0hoLQqYjbLFOXFGkHwUr7ndeRJXhDUUf2FZqwTB
 sL0+helX1Gru9khQWidMWVrmKdX91NJrAtkbIMu2cCdDfFkvr4P2g1M5sDWGLv3Kc5gbwOk6o
 RZHl3mQ8v6JBMfWDf/rg==
Subject: [Freedreno] [PATCH v2 00/24] drivers, fs: y2038 updates
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, jcmvbkbc@gmail.com,
 netdev@vger.kernel.org, sparclinux@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, devel@driverdev.osuosl.org,
 darrick.wong@oracle.com, richard@nod.at, cluster-devel@redhat.com,
 ccaulfie@redhat.com, linux+etnaviv@armlinux.org.uk,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 jdike@addtoit.com, linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org,
 christian.gmeiner@gmail.com, teigland@redhat.com, viro@zeniv.linux.org.uk,
 tglx@linutronix.de, sean@poorly.run, trond.myklebust@hammerspace.com,
 hirofumi@mail.parknet.co.jp, linux-nfs@vger.kernel.org,
 valdis.kletnieks@vt.edu, rfontana@redhat.com, gregkh@linuxfoundation.org,
 fw@strlen.de, anna.schumaker@netapp.com, linux-xfs@vger.kernel.org,
 robdclark@gmail.com, stefanr@s5r6.in-berlin.de, daniel@ffwll.ch, jack@suse.com,
 linux-fsdevel@vger.kernel.org, freedreno@lists.freedesktop.org,
 davem@davemloft.net, l.stach@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

These are updates to devidce drivers and file systems that for some
reason or another were not included in the kernel in the previous
y2038 series.

I've gone through all users of time_t again to make sure the
kernel is in a long-term maintainable state.

Posting these as a series for better organization, but each change
here is applicable standalone.

Please merge, review, ack/nack etc as you see fit. I will
add these to my y2038 branch [1] for linux-next, but can keep
rebasing for feedback and to remove any patches that get
picked up by a maintainer.

Changes since v1 [2]:

- Add Acks I received
- Rebase to v5.5-rc1, droping patches that got merged already
- Add NFS, XFS and the final three patches from another series
- Rewrite etnaviv patches

      Arnd

[1] https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/log/?h=y2038
[2] https://lore.kernel.org/lkml/20191108213257.3097633-1-arnd@arndb.de/

Arnd Bergmann (24):
  Input: input_event: fix struct padding on sparc64
  fat: use prandom_u32() for i_generation
  dlm: use SO_SNDTIMEO_NEW instead of SO_SNDTIMEO_OLD
  xtensa: ISS: avoid struct timeval
  um: ubd: use 64-bit time_t where possible
  acct: stop using get_seconds()
  tsacct: add 64-bit btime field
  packet: clarify timestamp overflow
  quota: avoid time_t in v1_disk_dqblk definition
  hostfs: pass 64-bit timestamps to/from user space
  hfs/hfsplus: use 64-bit inode timestamps
  drm/msm: avoid using 'timespec'
  drm/etnaviv: reject timeouts with tv_nsec >= NSEC_PER_SEC
  drm/etnaviv: avoid deprecated timespec
  sunrpc: convert to time64_t for expiry
  nfs: use time64_t internally
  nfs: fix timstamp debug prints
  nfs: fscache: use timespec64 in inode auxdata
  xfs: rename compat_time_t to old_time32_t
  xfs: disallow broken ioctls without compat-32-bit-time
  xfs: quota: move to time64_t interfaces
  y2038: remove obsolete jiffies conversion functions
  y2038: rename itimerval to __kernel_old_itimerval
  y2038: sparc: remove use of struct timex

 arch/sparc/kernel/sys_sparc_64.c              | 29 +++++-----
 arch/um/drivers/cow.h                         |  2 +-
 arch/um/drivers/cow_user.c                    |  7 ++-
 arch/um/drivers/ubd_kern.c                    | 10 ++--
 arch/um/include/shared/os.h                   |  2 +-
 arch/um/os-Linux/file.c                       |  2 +-
 .../platforms/iss/include/platform/simcall.h  |  4 +-
 drivers/gpu/drm/etnaviv/etnaviv_drv.c         | 20 ++++---
 drivers/gpu/drm/etnaviv/etnaviv_drv.h         | 11 ++--
 drivers/gpu/drm/etnaviv/etnaviv_gem.c         |  4 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.h         |  2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c         |  5 +-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h         |  5 +-
 drivers/gpu/drm/msm/msm_drv.h                 |  3 +-
 drivers/input/evdev.c                         | 14 ++---
 drivers/input/misc/uinput.c                   | 14 +++--
 fs/dlm/lowcomms.c                             |  6 +-
 fs/fat/inode.c                                |  3 +-
 fs/hfs/hfs_fs.h                               | 28 +++++++--
 fs/hfs/inode.c                                |  4 +-
 fs/hfsplus/hfsplus_fs.h                       | 28 +++++++--
 fs/hfsplus/inode.c                            | 12 ++--
 fs/hostfs/hostfs.h                            | 22 ++++---
 fs/hostfs/hostfs_kern.c                       | 15 +++--
 fs/nfs/fscache-index.c                        |  6 +-
 fs/nfs/fscache.c                              | 18 ++++--
 fs/nfs/fscache.h                              |  8 ++-
 fs/nfs/nfs4xdr.c                              | 10 ++--
 fs/quota/quotaio_v1.h                         |  6 +-
 fs/xfs/xfs_dquot.c                            |  6 +-
 fs/xfs/xfs_ioctl.c                            | 26 +++++++++
 fs/xfs/xfs_ioctl32.c                          |  2 +-
 fs/xfs/xfs_ioctl32.h                          |  2 +-
 fs/xfs/xfs_qm.h                               |  6 +-
 fs/xfs/xfs_quotaops.c                         |  6 +-
 fs/xfs/xfs_trans_dquot.c                      |  8 ++-
 include/linux/jiffies.h                       | 20 -------
 include/linux/sunrpc/cache.h                  | 42 ++++++++------
 include/linux/sunrpc/gss_api.h                |  4 +-
 include/linux/sunrpc/gss_krb5.h               |  2 +-
 include/linux/syscalls.h                      |  9 ++-
 include/uapi/linux/acct.h                     |  2 +
 include/uapi/linux/input.h                    |  1 +
 include/uapi/linux/taskstats.h                |  6 +-
 include/uapi/linux/time_types.h               |  5 ++
 include/uapi/linux/timex.h                    |  2 +
 kernel/acct.c                                 |  4 +-
 kernel/time/itimer.c                          | 18 +++---
 kernel/time/time.c                            | 58 ++-----------------
 kernel/tsacct.c                               |  9 ++-
 net/packet/af_packet.c                        | 27 +++++----
 net/sunrpc/auth_gss/gss_krb5_mech.c           | 12 +++-
 net/sunrpc/auth_gss/gss_krb5_seal.c           |  8 +--
 net/sunrpc/auth_gss/gss_krb5_unseal.c         |  6 +-
 net/sunrpc/auth_gss/gss_krb5_wrap.c           | 16 ++---
 net/sunrpc/auth_gss/gss_mech_switch.c         |  2 +-
 net/sunrpc/auth_gss/svcauth_gss.c             |  6 +-
 net/sunrpc/cache.c                            | 16 ++---
 net/sunrpc/svcauth_unix.c                     | 10 ++--
 59 files changed, 351 insertions(+), 290 deletions(-)

-- 
2.20.0

Cc: jdike@addtoit.com
Cc: richard@nod.at
Cc: jcmvbkbc@gmail.com
Cc: stefanr@s5r6.in-berlin.de
Cc: l.stach@pengutronix.de
Cc: linux+etnaviv@armlinux.org.uk
Cc: christian.gmeiner@gmail.com
Cc: airlied@linux.ie
Cc: daniel@ffwll.ch
Cc: robdclark@gmail.com
Cc: sean@poorly.run
Cc: valdis.kletnieks@vt.edu
Cc: gregkh@linuxfoundation.org
Cc: ccaulfie@redhat.com
Cc: teigland@redhat.com
Cc: hirofumi@mail.parknet.co.jp
Cc: jack@suse.com
Cc: davem@davemloft.net
Cc: fw@strlen.de
Cc: viro@zeniv.linux.org.uk
Cc: rfontana@redhat.com
Cc: tglx@linutronix.de
Cc: linux-um@lists.infradead.org
Cc: linux1394-devel@lists.sourceforge.net
Cc: etnaviv@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: devel@driverdev.osuosl.org
Cc: cluster-devel@redhat.com
Cc: linux-fsdevel@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: trond.myklebust@hammerspace.com
Cc: anna.schumaker@netapp.com
Cc: linux-nfs@vger.kernel.org
Cc: linux-xfs@vger.kernel.org
Cc: darrick.wong@oracle.com
Cc: sparclinux@vger.kernel.org
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
